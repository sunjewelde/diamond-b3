class TablesController < ApplicationController
	def new
	end

	require "date"
	def chart_second
	  	@latest_date = Diamond.maximum(:date)
	    @oldest_date = Diamond.minimum(:date)

	    if @latest_date.present?
		    @one_week_ago = @latest_date - 6
		    @one_months_ago = @latest_date - 30
		    @three_months_ago = @latest_date - 90
		    @six_months_ago = @latest_date - 180
		    @one_year_ago = @latest_date - 364
		end

		@weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
		@color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
		@clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2"]
		@cut_grade = ["Good", "Very Good", "Excellent", "EXC", "VGD", "F"]
		@polish = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good"]
		@symmetry = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good", "g", "Fair", "F"]
		@fluorescen = ["Medium", "Faint", "None", "Strong", "f", "mb", "NONE", "Medium Blue", "md blue", 
		           "st", "sb", "str blue", "S.BLUE", "M.BLUE", "VST", "Very Strong", "V.S.BLUE", "FT"]

	    #chart_secondページからグラフ描画の引数を取得
	        #For ransack
	    @q = Table.ransack(params[:q])
	    if params[:q] != nil
		    weight = params[:q][:weight]
		    color = params[:q][:color]
		    clar = params[:q][:clar]
		    date = params[:q][:date]
		else
			weight = 0.3
		    color = "D"
		    clar = "IF"
		    date = "1w"
	    end

	    # binding.pry

	    #date, clar, colorでグループ
	    if Table.exists?(date: @latest_date, weight: 0.3, color: "D", clar: "IF") and Table.exists?(date: @oldest_date, weight: 4.0, color: "M" )
  		else
			@weight03_diamond_group_all = Diamond.weight03
			@weight04_diamond_group_all = Diamond.weight04
			@weight05_diamond_group_all = Diamond.weight05
			@weight06_diamond_group_all = Diamond.weight06
			@weight07_diamond_group_all = Diamond.weight07
			@weight08_diamond_group_all = Diamond.weight08
			@weight09_diamond_group_all = Diamond.weight09
			@weight10_diamond_group_all = Diamond.weight10
			@weight12_diamond_group_all = Diamond.weight12
			@weight15_diamond_group_all = Diamond.weight15
			@weight18_diamond_group_all = Diamond.weight18
			@weight20_diamond_group_all = Diamond.weight20
			@weight30_diamond_group_all = Diamond.weight30
			@weight40_diamond_group_all = Diamond.weight40

			@weight03_group_all_color = @weight03_diamond_group_all.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar)
			@weight03_group_all_color_date = @weight03_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight04_group_all_color = @weight04_diamond_group_all.select('date, color, clar, AVG(end_price * 0.4 / weight) AS avg_price').group(:date, :color, :clar)
			@weight04_group_all_color_date = @weight04_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight05_group_all_color = @weight05_diamond_group_all.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').group(:date, :color, :clar)
			@weight05_group_all_color_date = @weight05_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight06_group_all_color = @weight06_diamond_group_all.select('date, color, clar, AVG(end_price * 0.6 / weight) AS avg_price').group(:date, :color, :clar)
			@weight06_group_all_color_date = @weight06_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight07_group_all_color = @weight07_diamond_group_all.select('date, color, clar, AVG(end_price * 0.7 / weight) AS avg_price').group(:date, :color, :clar)
			@weight07_group_all_color_date = @weight07_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight08_group_all_color = @weight08_diamond_group_all.select('date, color, clar, AVG(end_price * 0.8 / weight) AS avg_price').group(:date, :color, :clar)
			@weight08_group_all_color_date = @weight08_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight09_group_all_color = @weight09_diamond_group_all.select('date, color, clar, AVG(end_price * 0.9 / weight) AS avg_price').group(:date, :color, :clar)
			@weight09_group_all_color_date = @weight09_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight10_group_all_color = @weight10_diamond_group_all.select('date, color, clar, AVG(end_price * 1.0 / weight) AS avg_price').group(:date, :color, :clar)
			@weight10_group_all_color_date = @weight10_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight12_group_all_color = @weight12_diamond_group_all.select('date, color, clar, AVG(end_price * 1.2 / weight) AS avg_price').group(:date, :color, :clar)
			@weight12_group_all_color_date = @weight12_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight15_group_all_color = @weight15_diamond_group_all.select('date, color, clar, AVG(end_price * 1.5 / weight) AS avg_price').group(:date, :color, :clar)
			@weight15_group_all_color_date = @weight15_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight18_group_all_color = @weight18_diamond_group_all.select('date, color, clar, AVG(end_price * 1.8 / weight) AS avg_price').group(:date, :color, :clar)
			@weight18_group_all_color_date = @weight18_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight20_group_all_color = @weight20_diamond_group_all.select('date, color, clar, AVG(end_price * 2.0 / weight) AS avg_price').group(:date, :color, :clar)
			@weight20_group_all_color_date = @weight20_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight30_group_all_color = @weight30_diamond_group_all.select('date, color, clar, AVG(end_price * 3.0 / weight) AS avg_price').group(:date, :color, :clar)
			@weight30_group_all_color_date = @weight30_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			@weight40_group_all_color = @weight40_diamond_group_all.select('date, color, clar, AVG(end_price * 4.0 / weight) AS avg_price').group(:date, :color, :clar)
			@weight40_group_all_color_date = @weight40_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }

			#-----Create data table create for Table model-------------
			    #weight0.3
			    d = 0
			    while d < @weight03_group_all_color_date.length
			      date = @weight03_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 0.3, color: "D", clar: "IF") and Table.exists?(date: date, weight: 0.3, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight03_group_all_color.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                # binding.pry
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 0.3,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight0.4
			    d = 0
			    while d < @weight04_group_all_color_date.length
			      date = @weight04_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 0.4, color: "D", clar: "IF") and Table.exists?(date: date, weight: 0.4, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight04_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar

			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 0.4,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight0.5
			    d = 0
			    while d < @weight05_group_all_color_date.length
			      date = @weight05_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 0.5, color: "D", clar: "IF") and Table.exists?(date: date, weight: 0.5, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight05_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 0.5,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight0.6
			    d = 0
			    while d < @weight04_group_all_color_date.length
			      date = @weight04_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 0.6, color: "D", clar: "IF") and Table.exists?(date: date, weight: 0.6, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight06_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 0.6,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight0.7
			    d = 0
			    while d < @weight07_group_all_color_date.length
			      date = @weight07_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 0.7, color: "D", clar: "IF") and Table.exists?(date: date, weight: 0.7, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight07_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 0.7,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight0.8
			    d = 0
			    while d < @weight08_group_all_color_date.length
			      date = @weight08_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 0.8, color: "D", clar: "IF") and Table.exists?(date: date, weight: 0.8, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight08_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 0.8,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end
			    #weight0.9
			    d = 0
			    while d < @weight09_group_all_color_date.length
			      date = @weight09_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 0.9, color: "D", clar: "IF") and Table.exists?(date: date, weight: 0.9, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight09_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 0.9,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight10
			    d = 0
			    while d < @weight10_group_all_color_date.length
			      date = @weight10_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 1.0, color: "D", clar: "IF") and Table.exists?(date: date, weight: 1.0, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight10_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 1.0,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight12
			    d = 0
			    while d < @weight12_group_all_color_date.length
			      date = @weight12_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 1.2, color: "D", clar: "IF") and Table.exists?(date: date, weight: 1.2, color: "M", clar: "SI2")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight12_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 1.2,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight15
			    d = 0
			    while d < @weight15_group_all_color_date.length
			      date = @weight15_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 1.5, color: "D", clar: "IF") and Table.exists?(date: date, weight: 1.5, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight15_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 1.5,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight18
			    d = 0
			    while d < @weight18_group_all_color_date.length
			      date = @weight18_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 1.8, color: "D", clar: "IF") and Table.exists?(date: date, weight: 1.8, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight18_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 1.8,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight20
			    d = 0
			    while d < @weight20_group_all_color_date.length
			      date = @weight20_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 2.0, color: "D", clar: "IF") and Table.exists?(date: date, weight: 2.0, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight20_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 2.0,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight30
			    d = 0
			    while d < @weight30_group_all_color_date.length
			      date = @weight30_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 3.0, color: "D", clar: "IF") and Table.exists?(date: date, weight: 3.0, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight30_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 3.0,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end

			    #weight40
			    d = 0
			    while d < @weight40_group_all_color_date.length
			      date = @weight40_group_all_color_date[d]
			      if Table.exists?(date: date, weight: 4.0, color: "D", clar: "IF") and Table.exists?(date: date, weight: 4.0, color: "M")
			      else
			          i = 0
			          while i < @color.length
			              selected_color = @color[i]
			              j = 0
			              while j < @clar.length
			                selcted_clar = @clar[j]
			                @selected_color_data = @weight40_group_all_color.where(date: date).where(color: selected_color)
			                @selected_clar = @selected_color_data.find_by clar: selcted_clar
			                
			                  if @selected_clar.present? and @selected_clar.avg_price != ""
			                      @selected_price = @selected_clar.avg_price.round
			                      Table.create(date: date, color: selected_color, weight: 4.0,  clar: selcted_clar, price: @selected_price)
			                  end
			                j += 1
			              end
			              i += 1
			          end
			      end
			      d += 1
			    end
			  #-----End_Create data table create for Table model-------------
		end

	    @diamond_all = Table.all

	    @diamonds_default = Table.where(:date=> @one_week_ago..@latest_date).where(:weight=> 0.3).where(:clar => "IF").where(:color => "D").group(:date)
	    # binding.pry
	    # @diamonds = Table.where(:date=> @one_week_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	    @selected_date = date
	    if @selected_date == "1w"
	    	  @diamonds = Table.where(:date=> @one_week_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	      elsif @selected_date == "1m"
	      	  @diamonds = Table.where(:date=> @one_months_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	      elsif @selected_date == "3m"
	      	  @diamonds = Table.where(:date=> @three_months_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	      elsif @selected_date == "6m"
	      	  @diamonds = Table.where(:date=> @six_months_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	      elsif @selected_date == "1y"
	      	  @diamonds = Table.where(:date=> @one_year_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	    end

	    # binding.pry
	    # @diamond_table_data = @diamons
	    @selected_calr = clar
		if @selected_calr != "all"
			@diamond_table_data = @diamonds.where(:clar => clar).group(:date)
			@date_seriese = @diamond_table_data.pluck(:date)
			@selected_color_end_price_seriese = @diamond_table_data.pluck(:price)
		else
		   @diamond_table_data2 = @diamonds
		   @date_seriese2 = @diamond_table_data2.pluck(:date)
		    if_end_price = @diamond_table_data2.where(clar: "IF")
			vvs1_end_price = @diamond_table_data2.where(clar: "VVS1")
			vvs2_end_price = @diamond_table_data2.where(clar: "VVS2")
			vs1_end_price = @diamond_table_data2.where(clar: "VS1")
			vs2_end_price = @diamond_table_data2.where(clar: "VS2")
			si1_end_price = @diamond_table_data2.where(clar: "SI1")
			si2_end_price = @diamond_table_data2.where(clar: "SI2")

			if_end_price_seriese = if_end_price.pluck(:price)
			vvs1_end_price_seriese = vvs1_end_price.pluck(:price)
			vvs2_end_price_seriese = vvs2_end_price.pluck(:price)
			vs1_end_price_seriese = vs1_end_price.pluck(:price)
			vs2_end_price_seriese = vs2_end_price.pluck(:price)
			si1_end_price_seriese = si1_end_price.pluck(:price)
			si2_end_price_seriese = si2_end_price.pluck(:price)
		end


		@chart = LazyHighCharts::HighChart.new('graph') do |f|
			if clar == "all"
				  f.title(:text => "Diamond Price Chart #{weight}カラット")
				  f.xAxis(:categories => @date_seriese2)
				  f.yAxis(:title => { text: 'Diamond Price($)' })
				  
				  f.series(:name => "#{color}_IF", :data => if_end_price_seriese)
				  f.series(:name => "#{color}_VVS1", :data => vvs1_end_price_seriese)
				  f.series(:name => "#{color}_VVS2", :data => vvs2_end_price_seriese)
				  f.series(:name => "#{color}_VS1", :data => vs1_end_price_seriese)
				  f.series(:name => "#{color}_VS2", :data => vs2_end_price_seriese)
				  f.series(:name => "#{color}_SI1", :data => si1_end_price_seriese)
				  f.series(:name => "#{color}_SI2", :data => si2_end_price_seriese)
				  
				  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
				  f.chart(type: 'line', height: 600)

			elsif  clar != "all"
				  f.title(:text => "Diamond Price Chart #{weight}カラット")
				  f.xAxis(:categories => @date_seriese)
				  f.yAxis(:title => { text: 'Diamond Price($)' })
				  
				  f.series(:name => "#{color}_#{clar}", :data => @selected_color_end_price_seriese)
				  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
				  f.chart(type: 'line', height: 600)

			end
	 	end

	end

end