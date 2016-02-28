class ListsController < ApplicationController
  
  def new
  end

  def show
    @q = List.ransack(params[:q])

     @weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
     @color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
     @clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2"]
     @cut_grade = ["Good", "Very Good", "Excellent", "EXC", "VGD", "F"]
     @polish = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good"]
     @symmetry = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good", "g", "Fair", "F"]
     @fluorescen = ["Medium", "Faint", "None", "Strong", "f", "mb", "NONE", "Medium Blue", "md blue", 
                   "st", "sb", "str blue", "S.BLUE", "M.BLUE", "VST", "Very Strong", "V.S.BLUE", "FT"]

     #最新旧の日付を取得
    @latest_date = Diamond.maximum(:date)
    @oldest_date = Diamond.minimum(:date)
    if @latest_date.present?
      @one_week_ago = @latest_date - 6
    end

   
    if params[:q] != nil
      weight = params[:q][:weight]
      if params[:q][:date] != nil
        date = params[:q][:date]
      else
        date = @latest_date
      end
    else
      weight = 0.3
      date = @latest_date
    end

    selected_date = date
    @selected_weight = weight

    if List.exists?(date: selected_date)
      @selected_date = selected_date
    else
      @selected_date = @latest_date
      flash.now[:error] = "日付が選択されていない、又はその日付のデータがありません。"
    end

     # binding.pry
    if List.exists?(date: @latest_date, weight: 0.3, color: "D") and List.exists?(date: @oldest_date, weight: 40, color: "M")
    else
        #最新のDiamond_data
        # @latest_diamond_group = Diamond.where(date: @latest_date)
        #weightでグループ
        # @weight03_diamond_group = @latest_diamond_group.weight03
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

        #date, clar, colorでグループ

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

        #Data table create for List model
        #weight03
        d = 0
        while d < @weight03_group_all_color_date.length
          date = @weight03_group_all_color_date[d]
          # if List.exists?(date: date) and List.exists?(weight: 0.3) and List.exists?(color: "D") and List.exists?(color: "M")
          if List.exists?(date: date, weight: 0.3, color: "D") and List.exists?(date: date, weight: 0.3, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight03_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 0.3,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                  end
                  i += 1
              end
          end
          d += 1
        end


        #weight04
        d = 0
        while d < @weight04_group_all_color_date.length
          date = @weight04_group_all_color_date[d]
          if List.exists?(date: date, weight: 0.4, color: "D") and List.exists?(date: date, weight: 0.4, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight04_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 0.4,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                  end
                  i += 1
              end
          end
          d += 1
        end

        #weight05
        d = 0
        while d < @weight05_group_all_color_date.length
          date = @weight05_group_all_color_date[d]
          if List.exists?(date: date, weight: 0.5, color: "D") and List.exists?(date: date, weight: 0.5, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight05_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 0.5,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                  end
                  i += 1
              end
          end
          d += 1
        end

        #weight06
        d = 0
        while d < @weight06_group_all_color_date.length
          date = @weight06_group_all_color_date[d]
          if List.exists?(date: date, weight: 0.6, color: "D") and List.exists?(date: date, weight: 0.6, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight06_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 0.6,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                  end
                  i += 1
              end
          end
          d += 1
        end

        #weight07
        d = 0
        while d < @weight07_group_all_color_date.length
          date = @weight07_group_all_color_date[d]
          if List.exists?(date: date, weight: 0.7, color: "D") and List.exists?(date: date, weight: 0.7, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight07_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 0.7,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                  end
                  i += 1
              end
          end
          d += 1
        end

        #weight08
        d = 0
        while d < @weight08_group_all_color_date.length
          date = @weight08_group_all_color_date[d]
          if List.exists?(date: date, weight: 0.8, color: "D") and List.exists?(date: date, weight: 0.8, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight08_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 0.8,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                  end
                  i += 1
              end
          end
          d += 1
        end


        #weight09
        d = 0
        while d < @weight09_group_all_color_date.length
          date = @weight09_group_all_color_date[d]
          if List.exists?(date: date, weight: 0.9, color: "D") and List.exists?(date: date, weight: 0.9, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight09_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 0.9,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
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
          if List.exists?(date: date, weight: 1.0, color: "D") and List.exists?(date: date, weight: 1.0, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight10_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 1.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
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
          if List.exists?(date: date, weight: 1.2, color: "D") and List.exists?(date: date, weight: 1.2, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight12_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 1.2,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
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
          if List.exists?(date: date, weight: 1.5, color: "D") and List.exists?(date: date, weight: 1.5, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight15_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 1.5,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
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
          if List.exists?(date: date, weight: 1.8, color: "D") and List.exists?(date: date, weight: 1.8, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight18_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 1.8,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
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
          if List.exists?(date: date, weight: 2.0, color: "D") and List.exists?(date: date, weight: 2.0, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight20_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 2.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
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
          if List.exists?(date: date, weight: 3.0, color: "D") and List.exists?(date: date, weight: 3.0, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight30_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 3.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
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
          if List.exists?(date: date, weight: 4.0, color: "D") and List.exists?(date: date, weight: 4.0, color: "M")
          else
              i = 0
              while i < @color.length
                  selected_color = @color[i]
                  @selected_color_data = @weight40_group_all_color.where(date: date).where(color: selected_color)
                  # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                  @selected_color_IF = @selected_color_data.find_by clar: "IF"
                  @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                  @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                  @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                  @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                  @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                  @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                # binding.pry 
                  @IF_price = @selected_color_IF.avg_price.round if @selected_color_IF.present?
                  @VVS1_price = @selected_color_VVS1.avg_price.round if @selected_color_VVS1.present?
                  @VVS2_price = @selected_color_VVS2.avg_price.round if @selected_color_VVS2.present?
                  @VS1_price = @selected_color_VS1.avg_price.round if @selected_color_VS1.present?
                  @VS2_price = @selected_color_VS2.avg_price.round if @selected_color_VS2.present?
                  @SI1_price = @selected_color_SI1.avg_price.round if @selected_color_SI1.present?
                  @SI2_price = @selected_color_SI2.avg_price.round if @selected_color_SI2.present?

                  if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                    List.create(date: date, color: selected_color, weight: 4.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                  end
                  i += 1
              end
          end
          d += 1
        end
      #-----End_Data table create for List model---------
        
    end

      # binding.pry
      #配列からWhileでloop
      # i = 0
      # while i < ary.length
      #   print ary[i]
      #   i += 1
      # end

     @selected_latest_weight_group = List.select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2').where(weight: weight).where(date: @selected_date)
  end

  
  def list_table
    @q = List.ransack(params[:q])
  end
   
   
    
end
