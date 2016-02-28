class DiamondsController < ApplicationController
  
  def new
    @diamond = Diamond.new
  end

  def group_color(weight, color)
    "@weight" + weight + "_diamond_group.weight" + weight + ".color(" + "\"" + color + "\"" + ")"
  end

  def import
     # fileはtmpに自動で一時保存される
    Diamond.import(params[:csv_file])
    redirect_to root_url, notice: "Diamondデータを追加しました。"
  end
  
  require "date"
  def index
   
    
    # @diamonds = Diamond.all
    #kaminariでページネーション
    # @diamonds = Diamond.page(params[:page])
    @q = Diamond.ransack(params[:q])
    # @diamonds2 = @q.result(distinct: true)
   
   @weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
   @color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
  # @color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "FIY", "FLY", "FY", "Y-Z"]
   # @clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2", "I1", "FL"]
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
   date_range =  @latest_date - @oldest_date
   # three_days_ago = @latest_date -3

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

   @latest_weight_group_03 = List.select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2').where(weight: 0.3).where(date: @latest_date)

  if Table.exists?(date: @latest_date, weight: 0.3, color: "D", clar: "IF") and Table.exists?(date: @oldest_date, weight: 4.0, color: "M" )
  else
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

   @latest_chart_table_weight_group_03 = Table.select('date, color, clar, price').where(weight: 0.3).group(:date, :color, :clar)


   @latest_one_week_data = Table.select('date, weight, color, clar, price').where(:date=> @one_week_ago..@latest_date).group(:date, :weight, :color, :clar)
   weight_group_03_color_D_IF = @latest_one_week_data.where(weight: 0.3).where(color: "D").where(clar: "IF")
   
    #0.3_All
    #Date
    weight_group_03_color_D_IF_date = weight_group_03_color_D_IF.pluck(:date)
    weight_group_03_color_D_IF_end_price = weight_group_03_color_D_IF.pluck(:price)
    # weight_group_03_color_D_IF_date = []
    # @daily_weight_group_03_color_D_IF.each do |diamond|
    #   weight_group_03_color_D_IF_date << diamond.date
    # end

    # binding.pry
    
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      
      f.global(useUTC: false)
      # @sdate = weight_group_03_color_D_IF_date.find.first
      @date = weight_group_03_color_D_IF_date
      # binding.pry
      f.title(:text => "Diamond Price Chart (0.3カラット Latest one week)")
      
      # f.xAxis(:type => 'datetime', :dateTimeLabelFormats => { month: '%b %e, %Y' })
      f.xAxis(:categories => @date)
      f.yAxis(:title => { text: 'Diamond Price($)' })
      
      # f.xAxis(:categories => weight_group_03_color_D_IF_date)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_IF", :data => weight_group_03_color_D_IF_end_price)
      f.series(:name => "0.3_D_IF", :data => weight_group_03_color_D_IF_end_price)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_VVS1", :data => weight_group_03_color_D_VVS1_end_price)

      
      f.legend(:align => 'right', :verticalAlign => 'top', :y => 0, :x => -50, :layout => 'vertical',)
      f.chart(type: 'line', height: 600, marginLeft: 50, marginRight: 50)
      # f.chart({:defaultSeriesType=>"column"})
    end

  end
  
  def create
    @diamond = Diamond.new(diamond_params)
    @diamond.save
    redirect_to root_path , notice: 'データを保存しました'
  end
  
  
  def chart
    @latest_date = Table.maximum(:date)
    @oldest_date = Table.minimum(:date)
    @one_week_ago = @latest_date - 6
    @one_months_ago = @latest_date - 30
    @three_months_ago = @latest_date - 90
    @six_months_ago = @latest_date - 180
    @one_year_ago = @latest_date - 364

    #indexページからグラフ描画の引数を取得
    weight = params[:q][:weight]
    color = params[:q][:color]
    clar = params[:q][:clar]
    date = params[:q][:date]

    if date == "1w"
        onw_week_data = Table.where(:date=> @one_week_ago..@latest_date)
        # @diamonds = onw_week_data.ransack(:weight_eq => weight).result
        # @diamonds = onw_week_data.weight"#{weight}"
        @diamonds = onw_week_data.where(:weight=> weight)
      elsif date == "1m"
        one_month_data = Table.where(:date=> @one_months_ago..@latest_date)
        # @diamonds = one_month_data.ransack(:weight_eq => weight).result
        # @diamonds = one_month_data.weight"#{weight}"
        @diamonds = one_month_data.where(:weight=> weight)
      elsif date == "3m"
        three_month_data = Table.where(:date=> @three_months_ago..@latest_date)
        # @diamonds = three_month_data.ransack(:weight_eq => weight).result
        @diamonds = three_month_data.where(:weight=> weight)
      elsif date == "6m"
        six_month_data = Table.where(:date=> @six_months_ago..@latest_date)
        # @diamonds = six_month_data.ransack(:weight_eq => weight).result
        @diamonds = six_month_data.where(:weight=> weight)
      elsif date == "1y"
        one_year_data = Table.where(:date=> @one_year_ago..@latest_date)
        # @diamonds = one_year_data.ransack(:weight_eq => weight).result
        @diamonds = one_year_data.where(:weight=> weight)
      elsif date == "max"
        full_year_data = Table.all
        # @diamonds = full_year_data.ransack(:weight_eq => weight).result
        @diamonds = full_year_data.where(:weight=> weight)
    end
    
    #For ransack
    @q = Table.ransack(params[:q])
    
    #Weightでソート
    # @diamonds = Diamond.ransack(:weight_eq => weight).result(distinct: true)

    @diamonds_D = @diamonds.ransack(:color_eq => "D").result
    @diamonds_E = @diamonds.ransack(:color_eq => "E").result
    @diamonds_F = @diamonds.ransack(:color_eq => "F").result
    @diamonds_G = @diamonds.ransack(:color_eq => "G").result
    @diamonds_H = @diamonds.ransack(:color_eq => "H").result
    @diamonds_I = @diamonds.ransack(:color_eq => "I").result
    @diamonds_J = @diamonds.ransack(:color_eq => "J").result
    @diamonds_K = @diamonds.ransack(:color_eq => "K").result
    @diamonds_L = @diamonds.ransack(:color_eq => "L").result
    @diamonds_M = @diamonds.ransack(:color_eq => "M").result
    
    #Weight+Colorでソート
    @diamonds_color = @diamonds.ransack(:color_eq => color).result
    
    g_if_end_price = @diamonds_color.ransack(:clar_eq => "IF").result
    g_vvs1_end_price = @diamonds_color.ransack(:clar_eq => "VVS1").result
    g_vvs2_end_price = @diamonds_color.ransack(:clar_eq => "VVS2").result
    g_vs1_end_price = @diamonds_color.ransack(:clar_eq => "VS1").result
    g_vs2_end_price = @diamonds_color.ransack(:clar_eq => "VS2").result
    g_si1_end_price = @diamonds_color.ransack(:clar_eq => "SI1").result
    g_si2_end_price = @diamonds_color.ransack(:clar_eq => "SI2").result

    @weight_color_group_if = g_if_end_price.select("date, color, clar, price").group(:date)
    @weight_color_group_vvs1 = g_vvs1_end_price.select("date, color, clar, price").group(:date)
    @weight_color_group_vvs2 = g_vvs2_end_price.select("date, color, clar, price").group(:date)
    @weight_color_group_vs1 = g_vs1_end_price.select("date, color, clar, price").group(:date)
    @weight_color_group_vs2 = g_vs2_end_price.select("date, color, clar, price").group(:date)
    @weight_color_group_si1 = g_si1_end_price.select("date, color, clar, price").group(:date)
    @weight_color_group_si2 = g_si2_end_price.select("date, color, clar, price").group(:date)

    #Date
    group_IF_date = []
    group_VVS1_date = []
    group_VVS2_date = []
    group_VS1_date = []
    group_VS2_date = []
    group_SI1_date = []
    group_SI2_date = []

    @weight_color_group_if.each do |diamond|
      group_IF_date << diamond.date
    end

    @weight_color_group_vvs1.each do |diamond|
      group_VVS1_date << diamond.date
    end

    @weight_color_group_vvs2.each do |diamond|
      group_VVS2_date << diamond.date
    end

    @weight_color_group_vs1.each do |diamond|
      group_VS1_date << diamond.date
    end

    @weight_color_group_vs2.each do |diamond|
      group_VS2_date << diamond.date
    end

    @weight_color_group_si1.each do |diamond|
      group_SI1_date << diamond.date
    end

    @weight_color_group_si2.each do |diamond|
      group_SI2_date << diamond.date
    end

    if_end_price = []
    vvs1_end_price = []
    vvs2_end_price = []
    vs1_end_price = []
    vs2_end_price = []
    si1_end_price = []
    si2_end_price = []

    @weight_color_group_if.each do |diamond|
      # if_end_price << diamond.avg_price.round
      if_end_price << diamond.price
    end

    @weight_color_group_vvs1.each do |diamond|
      vvs1_end_price << diamond.price
    end

    @weight_color_group_vvs2.each do |diamond|
      vvs2_end_price << diamond.price
    end

    @weight_color_group_vs1.each do |diamond|
      vs1_end_price << diamond.price
    end

    @weight_color_group_vs2.each do |diamond|
      vs2_end_price << diamond.price
    end

    @weight_color_group_si1.each do |diamond|
      si1_end_price << diamond.price
    end

    @weight_color_group_si2.each do |diamond|
      si2_end_price << diamond.price
    end

    #Weight+Color+clarでソート
    @diamonds_clar = @diamonds_color.ransack(:clar_eq => clar).result
    
    @g_clar_end_price = @diamonds_clar.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)

    clar_end_price = []
    @g_clar_end_price.each do |diamond|
      clar_end_price << diamond.price
    end

    # binding.pry
    
    #Date
    # date2 = @diamonds.pluck(:date)
    
    #color_D
    g_color_D_IF_end_price = @diamonds_D.ransack(:clar_eq => "IF").result
    g_color_D_VVS1_end_price = @diamonds_D.ransack(:clar_eq => "VVS1").result
    g_color_D_VVS2_end_price = @diamonds_D.ransack(:clar_eq => "VVS2").result
    g_color_D_VS1_end_price = @diamonds_D.ransack(:clar_eq => "VS1").result
    g_color_D_VS2_end_price = @diamonds_D.ransack(:clar_eq => "VS2").result
    g_color_D_SI1_end_price = @diamonds_D.ransack(:clar_eq => "SI1").result
    g_color_D_SI2_end_price = @diamonds_D.ransack(:clar_eq => "SI2").result

    @color_D_group_if = g_color_D_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_vvs1 = g_color_D_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_vvs2 = g_color_D_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_vs1 = g_color_D_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_vs2 = g_color_D_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_si1 = g_color_D_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_si2 = g_color_D_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_D_IF_end_price = []
    color_D_VVS1_end_price = []
    color_D_VVS2_end_price = []
    color_D_VS1_end_price = []
    color_D_VS2_end_price = []
    color_D_SI1_end_price = []
    color_D_SI2_end_price = []

    @color_D_group_if.each do |diamond|
      color_D_IF_end_price << diamond.avg_price.round
    end

    @color_D_group_vvs1.each do |diamond|
      color_D_VVS1_end_price << diamond.avg_price.round
    end

    @color_D_group_vvs2.each do |diamond|
      color_D_VVS2_end_price << diamond.avg_price.round
    end

    @color_D_group_vs1.each do |diamond|
      color_D_VS1_end_price << diamond.avg_price.round
    end

    @color_D_group_vs2.each do |diamond|
      color_D_VS2_end_price << diamond.avg_price.round
    end

    @color_D_group_si1.each do |diamond|
      color_D_SI1_end_price << diamond.avg_price.round
    end

    @color_D_group_si2.each do |diamond|
      color_D_SI2_end_price << diamond.avg_price.round
    end

    #color_E
    g_color_E_IF_end_price = @diamonds_E.ransack(:clar_eq => "IF").result
    g_color_E_VVS1_end_price = @diamonds_E.ransack(:clar_eq => "VVS1").result
    g_color_E_VVS2_end_price = @diamonds_E.ransack(:clar_eq => "VVS2").result
    g_color_E_VS1_end_price = @diamonds_E.ransack(:clar_eq => "VS1").result
    g_color_E_VS2_end_price = @diamonds_E.ransack(:clar_eq => "VS2").result
    g_color_E_SI1_end_price = @diamonds_E.ransack(:clar_eq => "SI1").result
    g_color_E_SI2_end_price = @diamonds_E.ransack(:clar_eq => "SI2").result

    @color_E_group_if = g_color_E_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_vvs1 = g_color_E_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_vvs2 = g_color_E_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_vs1 = g_color_E_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_vs2 = g_color_E_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_si1 = g_color_E_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_si2 = g_color_E_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_E_IF_end_price = []
    color_E_VVS1_end_price = []
    color_E_VVS2_end_price = []
    color_E_VS1_end_price = []
    color_E_VS2_end_price = []
    color_E_SI1_end_price = []
    color_E_SI2_end_price = []

    @color_E_group_if.each do |diamond|
      color_E_IF_end_price << diamond.avg_price.round
    end

    @color_E_group_vvs1.each do |diamond|
      color_E_VVS1_end_price << diamond.avg_price.round
    end

    @color_E_group_vvs2.each do |diamond|
      color_E_VVS2_end_price << diamond.avg_price.round
    end

    @color_E_group_vs1.each do |diamond|
      color_E_VS1_end_price << diamond.avg_price.round
    end

    @color_E_group_vs2.each do |diamond|
      color_E_VS2_end_price << diamond.avg_price.round
    end

    @color_E_group_si1.each do |diamond|
      color_E_SI1_end_price << diamond.avg_price.round
    end

    @color_E_group_si2.each do |diamond|
      color_E_SI2_end_price << diamond.avg_price.round
    end
    
    #color_F
    g_color_F_IF_end_price = @diamonds_F.ransack(:clar_eq => "IF").result
    g_color_F_VVS1_end_price = @diamonds_F.ransack(:clar_eq => "VVS1").result
    g_color_F_VVS2_end_price = @diamonds_F.ransack(:clar_eq => "VVS2").result
    g_color_F_VS1_end_price = @diamonds_F.ransack(:clar_eq => "VS1").result
    g_color_F_VS2_end_price = @diamonds_F.ransack(:clar_eq => "VS2").result
    g_color_F_SI1_end_price = @diamonds_F.ransack(:clar_eq => "SI1").result
    g_color_F_SI2_end_price = @diamonds_F.ransack(:clar_eq => "SI2").result

    @color_F_group_if = g_color_F_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_vvs1 = g_color_F_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_vvs2 = g_color_F_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_vs1 = g_color_F_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_vs2 = g_color_F_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_si1 = g_color_F_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_si2 = g_color_F_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_F_IF_end_price = []
    color_F_VVS1_end_price = []
    color_F_VVS2_end_price = []
    color_F_VS1_end_price = []
    color_F_VS2_end_price = []
    color_F_SI1_end_price = []
    color_F_SI2_end_price = []

    @color_F_group_if.each do |diamond|
      color_F_IF_end_price << diamond.avg_price.round
    end

    @color_F_group_vvs1.each do |diamond|
      color_F_VVS1_end_price << diamond.avg_price.round
    end

    @color_F_group_vvs2.each do |diamond|
      color_F_VVS2_end_price << diamond.avg_price.round
    end

    @color_F_group_vs1.each do |diamond|
      color_F_VS1_end_price << diamond.avg_price.round
    end

    @color_F_group_vs2.each do |diamond|
      color_F_VS2_end_price << diamond.avg_price.round
    end

    @color_F_group_si1.each do |diamond|
      color_F_SI1_end_price << diamond.avg_price.round
    end

    @color_F_group_si2.each do |diamond|
      color_F_SI2_end_price << diamond.avg_price.round
    end
    
    #color_G
    g_color_G_IF_end_price = @diamonds_G.ransack(:clar_eq => "IF").result
    g_color_G_VVS1_end_price = @diamonds_G.ransack(:clar_eq => "VVS1").result
    g_color_G_VVS2_end_price = @diamonds_G.ransack(:clar_eq => "VVS2").result
    g_color_G_VS1_end_price = @diamonds_G.ransack(:clar_eq => "VS1").result
    g_color_G_VS2_end_price = @diamonds_G.ransack(:clar_eq => "VS2").result
    g_color_G_SI1_end_price = @diamonds_G.ransack(:clar_eq => "SI1").result
    g_color_G_SI2_end_price = @diamonds_G.ransack(:clar_eq => "SI2").result

    @color_G_group_if = g_color_G_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_vvs1 = g_color_G_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_vvs2 = g_color_G_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_vs1 = g_color_G_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_vs2 = g_color_G_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_si1 = g_color_G_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_si2 = g_color_G_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_G_IF_end_price = []
    color_G_VVS1_end_price = []
    color_G_VVS2_end_price = []
    color_G_VS1_end_price = []
    color_G_VS2_end_price = []
    color_G_SI1_end_price = []
    color_G_SI2_end_price = []

    @color_G_group_if.each do |diamond|
      color_G_IF_end_price << diamond.avg_price.round
    end

    @color_G_group_vvs1.each do |diamond|
      color_G_VVS1_end_price << diamond.avg_price.round
    end

    @color_G_group_vvs2.each do |diamond|
      color_G_VVS2_end_price << diamond.avg_price.round
    end

    @color_G_group_vs1.each do |diamond|
      color_G_VS1_end_price << diamond.avg_price.round
    end

    @color_G_group_vs2.each do |diamond|
      color_G_VS2_end_price << diamond.avg_price.round
    end

    @color_G_group_si1.each do |diamond|
      color_G_SI1_end_price << diamond.avg_price.round
    end

    @color_G_group_si2.each do |diamond|
      color_G_SI2_end_price << diamond.avg_price.round
    end

    
    #color_H
    g_color_H_IF_end_price = @diamonds_H.ransack(:clar_eq => "IF").result
    g_color_H_VVS1_end_price = @diamonds_H.ransack(:clar_eq => "VVS1").result
    g_color_H_VVS2_end_price = @diamonds_H.ransack(:clar_eq => "VVS2").result
    g_color_H_VS1_end_price = @diamonds_H.ransack(:clar_eq => "VS1").result
    g_color_H_VS2_end_price = @diamonds_H.ransack(:clar_eq => "VS2").result
    g_color_H_SI1_end_price = @diamonds_H.ransack(:clar_eq => "SI1").result
    g_color_H_SI2_end_price = @diamonds_H.ransack(:clar_eq => "SI2").result

    @color_H_group_if = g_color_H_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_vvs1 = g_color_H_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_vvs2 = g_color_H_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_vs1 = g_color_H_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_vs2 = g_color_H_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_si1 = g_color_H_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_si2 = g_color_H_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_H_IF_end_price = []
    color_H_VVS1_end_price = []
    color_H_VVS2_end_price = []
    color_H_VS1_end_price = []
    color_H_VS2_end_price = []
    color_H_SI1_end_price = []
    color_H_SI2_end_price = []

    @color_H_group_if.each do |diamond|
      color_H_IF_end_price << diamond.avg_price.round
    end

    @color_H_group_vvs1.each do |diamond|
      color_H_VVS1_end_price << diamond.avg_price.round
    end

    @color_H_group_vvs2.each do |diamond|
      color_H_VVS2_end_price << diamond.avg_price.round
    end

    @color_H_group_vs1.each do |diamond|
      color_H_VS1_end_price << diamond.avg_price.round
    end

    @color_H_group_vs2.each do |diamond|
      color_H_VS2_end_price << diamond.avg_price.round
    end

    @color_H_group_si1.each do |diamond|
      color_H_SI1_end_price << diamond.avg_price.round
    end

    @color_H_group_si2.each do |diamond|
      color_H_SI2_end_price << diamond.avg_price.round
    end

    
    #color_I
    g_color_I_IF_end_price = @diamonds_I.ransack(:clar_eq => "IF").result
    g_color_I_VVS1_end_price = @diamonds_I.ransack(:clar_eq => "VVS1").result
    g_color_I_VVS2_end_price = @diamonds_I.ransack(:clar_eq => "VVS2").result
    g_color_I_VS1_end_price = @diamonds_I.ransack(:clar_eq => "VS1").result
    g_color_I_VS2_end_price = @diamonds_I.ransack(:clar_eq => "VS2").result
    g_color_I_SI1_end_price = @diamonds_I.ransack(:clar_eq => "SI1").result
    g_color_I_SI2_end_price = @diamonds_I.ransack(:clar_eq => "SI2").result

    @color_I_group_if = g_color_I_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_vvs1 = g_color_I_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_vvs2 = g_color_I_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_vs1 = g_color_I_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_vs2 = g_color_I_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_si1 = g_color_I_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_si2 = g_color_I_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_I_IF_end_price = []
    color_I_VVS1_end_price = []
    color_I_VVS2_end_price = []
    color_I_VS1_end_price = []
    color_I_VS2_end_price = []
    color_I_SI1_end_price = []
    color_I_SI2_end_price = []

    @color_I_group_if.each do |diamond|
      color_I_IF_end_price << diamond.avg_price.round
    end

    @color_I_group_vvs1.each do |diamond|
      color_I_VVS1_end_price << diamond.avg_price.round
    end

    @color_I_group_vvs2.each do |diamond|
      color_I_VVS2_end_price << diamond.avg_price.round
    end

    @color_I_group_vs1.each do |diamond|
      color_I_VS1_end_price << diamond.avg_price.round
    end

    @color_I_group_vs2.each do |diamond|
      color_I_VS2_end_price << diamond.avg_price.round
    end

    @color_I_group_si1.each do |diamond|
      color_I_SI1_end_price << diamond.avg_price.round
    end

    @color_I_group_si2.each do |diamond|
      color_I_SI2_end_price << diamond.avg_price.round
    end

    
    #color_J
    g_color_J_IF_end_price = @diamonds_J.ransack(:clar_eq => "IF").result
    g_color_J_VVS1_end_price = @diamonds_J.ransack(:clar_eq => "VVS1").result
    g_color_J_VVS2_end_price = @diamonds_J.ransack(:clar_eq => "VVS2").result
    g_color_J_VS1_end_price = @diamonds_J.ransack(:clar_eq => "VS1").result
    g_color_J_VS2_end_price = @diamonds_J.ransack(:clar_eq => "VS2").result
    g_color_J_SI1_end_price = @diamonds_J.ransack(:clar_eq => "SI1").result
    g_color_J_SI2_end_price = @diamonds_J.ransack(:clar_eq => "SI2").result

    @color_J_group_if = g_color_J_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_vvs1 = g_color_J_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_vvs2 = g_color_J_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_vs1 = g_color_J_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_vs2 = g_color_J_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_si1 = g_color_J_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_si2 = g_color_J_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_J_IF_end_price = []
    color_J_VVS1_end_price = []
    color_J_VVS2_end_price = []
    color_J_VS1_end_price = []
    color_J_VS2_end_price = []
    color_J_SI1_end_price = []
    color_J_SI2_end_price = []

    @color_J_group_if.each do |diamond|
      color_J_IF_end_price << diamond.avg_price.round
    end

    @color_J_group_vvs1.each do |diamond|
      color_J_VVS1_end_price << diamond.avg_price.round
    end

    @color_J_group_vvs2.each do |diamond|
      color_J_VVS2_end_price << diamond.avg_price.round
    end

    @color_J_group_vs1.each do |diamond|
      color_J_VS1_end_price << diamond.avg_price.round
    end

    @color_J_group_vs2.each do |diamond|
      color_J_VS2_end_price << diamond.avg_price.round
    end

    @color_J_group_si1.each do |diamond|
      color_J_SI1_end_price << diamond.avg_price.round
    end

    @color_J_group_si2.each do |diamond|
      color_J_SI2_end_price << diamond.avg_price.round
    end

    
    #color_K
    g_color_K_IF_end_price = @diamonds_K.ransack(:clar_eq => "IF").result
    g_color_K_VVS1_end_price = @diamonds_K.ransack(:clar_eq => "VVS1").result
    g_color_K_VVS2_end_price = @diamonds_K.ransack(:clar_eq => "VVS2").result
    g_color_K_VS1_end_price = @diamonds_K.ransack(:clar_eq => "VS1").result
    g_color_K_VS2_end_price = @diamonds_K.ransack(:clar_eq => "VS2").result
    g_color_K_SI1_end_price = @diamonds_K.ransack(:clar_eq => "SI1").result
    g_color_K_SI2_end_price = @diamonds_K.ransack(:clar_eq => "SI2").result

    @color_K_group_if = g_color_K_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_vvs1 = g_color_K_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_vvs2 = g_color_K_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_vs1 = g_color_K_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_vs2 = g_color_K_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_si1 = g_color_K_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_si2 = g_color_K_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_K_IF_end_price = []
    color_K_VVS1_end_price = []
    color_K_VVS2_end_price = []
    color_K_VS1_end_price = []
    color_K_VS2_end_price = []
    color_K_SI1_end_price = []
    color_K_SI2_end_price = []

    @color_K_group_if.each do |diamond|
      color_K_IF_end_price << diamond.avg_price.round
    end

    @color_K_group_vvs1.each do |diamond|
      color_K_VVS1_end_price << diamond.avg_price.round
    end

    @color_K_group_vvs2.each do |diamond|
      color_K_VVS2_end_price << diamond.avg_price.round
    end

    @color_K_group_vs1.each do |diamond|
      color_K_VS1_end_price << diamond.avg_price.round
    end

    @color_K_group_vs2.each do |diamond|
      color_K_VS2_end_price << diamond.avg_price.round
    end

    @color_K_group_si1.each do |diamond|
      color_K_SI1_end_price << diamond.avg_price.round
    end

    @color_K_group_si2.each do |diamond|
      color_K_SI2_end_price << diamond.avg_price.round
    end

    
    #color_L
    g_color_L_IF_end_price = @diamonds_L.ransack(:clar_eq => "IF").result
    g_color_L_VVS1_end_price = @diamonds_L.ransack(:clar_eq => "VVS1").result
    g_color_L_VVS2_end_price = @diamonds_L.ransack(:clar_eq => "VVS2").result
    g_color_L_VS1_end_price = @diamonds_L.ransack(:clar_eq => "VS1").result
    g_color_L_VS2_end_price = @diamonds_L.ransack(:clar_eq => "VS2").result
    g_color_L_SI1_end_price = @diamonds_L.ransack(:clar_eq => "SI1").result
    g_color_L_SI2_end_price = @diamonds_L.ransack(:clar_eq => "SI2").result

    @color_L_group_if = g_color_L_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_vvs1 = g_color_L_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_vvs2 = g_color_L_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_vs1 = g_color_L_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_vs2 = g_color_L_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_si1 = g_color_L_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_si2 = g_color_L_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_L_IF_end_price = []
    color_L_VVS1_end_price = []
    color_L_VVS2_end_price = []
    color_L_VS1_end_price = []
    color_L_VS2_end_price = []
    color_L_SI1_end_price = []
    color_L_SI2_end_price = []

    @color_L_group_if.each do |diamond|
      color_L_IF_end_price << diamond.avg_price.round
    end

    @color_L_group_vvs1.each do |diamond|
      color_L_VVS1_end_price << diamond.avg_price.round
    end

    @color_L_group_vvs2.each do |diamond|
      color_L_VVS2_end_price << diamond.avg_price.round
    end

    @color_L_group_vs1.each do |diamond|
      color_L_VS1_end_price << diamond.avg_price.round
    end

    @color_L_group_vs2.each do |diamond|
      color_L_VS2_end_price << diamond.avg_price.round
    end

    @color_L_group_si1.each do |diamond|
      color_L_SI1_end_price << diamond.avg_price.round
    end

    @color_L_group_si2.each do |diamond|
      color_L_SI2_end_price << diamond.avg_price.round
    end
    
    #color_M
    g_color_M_IF_end_price = @diamonds_M.ransack(:clar_eq => "IF").result
    g_color_M_VVS1_end_price = @diamonds_M.ransack(:clar_eq => "VVS1").result
    g_color_M_VVS2_end_price = @diamonds_M.ransack(:clar_eq => "VVS2").result
    g_color_M_VS1_end_price = @diamonds_M.ransack(:clar_eq => "VS1").result
    g_color_M_VS2_end_price = @diamonds_M.ransack(:clar_eq => "VS2").result
    g_color_M_SI1_end_price = @diamonds_M.ransack(:clar_eq => "SI1").result
    g_color_M_SI2_end_price = @diamonds_M.ransack(:clar_eq => "SI2").result

    @color_M_group_if = g_color_M_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_vvs1 = g_color_M_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_vvs2 = g_color_M_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_vs1 = g_color_M_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_vs2 = g_color_M_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_si1 = g_color_M_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_si2 = g_color_M_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_M_IF_end_price = []
    color_M_VVS1_end_price = []
    color_M_VVS2_end_price = []
    color_M_VS1_end_price = []
    color_M_VS2_end_price = []
    color_M_SI1_end_price = []
    color_M_SI2_end_price = []

    @color_M_group_if.each do |diamond|
      color_M_IF_end_price << diamond.avg_price.round
    end

    @color_M_group_vvs1.each do |diamond|
      color_M_VVS1_end_price << diamond.avg_price.round
    end

    @color_M_group_vvs2.each do |diamond|
      color_M_VVS2_end_price << diamond.avg_price.round
    end

    @color_M_group_vs1.each do |diamond|
      color_M_VS1_end_price << diamond.avg_price.round
    end

    @color_M_group_vs2.each do |diamond|
      color_M_VS2_end_price << diamond.avg_price.round
    end

    @color_M_group_si1.each do |diamond|
      color_M_SI1_end_price << diamond.avg_price.round
    end

    @color_M_group_si2.each do |diamond|
      color_M_SI2_end_price << diamond.avg_price.round
    end

    

    # binding.pry
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      # binding.pry
  
      if color == "all" and clar == "all"
        #カラット別で表示
          f.title(:text => "Diamond Price Chart #{weight}カラット")
          f.xAxis(:categories => group_IF_date)
          f.yAxis(:title => { text: 'Diamond Price($)' })
          #D_
          f.series(:name => "D_IF", :data => color_D_IF_end_price)
          f.series(:name => "D_VVS1", :data => color_D_VVS1_end_price)
          f.series(:name => "D_VVS2", :data => color_D_VVS2_end_price)
          f.series(:name => "D_VS1", :data => color_D_VS1_end_price)
          f.series(:name => "D_VS2", :data => color_D_VS2_end_price)
          f.series(:name => "D_SI1", :data => color_D_SI1_end_price)
          f.series(:name => "D_SI2", :data => color_D_SI2_end_price)
          
          #E_
          f.series(:name => "E_IF", :data => color_E_IF_end_price)
          f.series(:name => "E_VVS1", :data => color_E_VVS1_end_price)
          f.series(:name => "E_VVS2", :data => color_E_VVS2_end_price)
          f.series(:name => "E_VS1", :data => color_E_VS1_end_price)
          f.series(:name => "E_VS2", :data => color_E_VS2_end_price)
          f.series(:name => "E_SI1", :data => color_E_SI1_end_price)
          f.series(:name => "E_SI2", :data => color_E_SI2_end_price)
          
          #F_
          f.series(:name => "F_IF", :data => color_F_IF_end_price)
          f.series(:name => "F_VVS1", :data => color_F_VVS1_end_price)
          f.series(:name => "F_VVS2", :data => color_F_VVS2_end_price)
          f.series(:name => "F_VS1", :data => color_F_VS1_end_price)
          f.series(:name => "F_VS2", :data => color_F_VS2_end_price)
          f.series(:name => "F_SI1", :data => color_F_SI1_end_price)
          f.series(:name => "F_SI2", :data => color_F_SI2_end_price)
          
          #G_
          f.series(:name => "G_IF", :data => color_G_IF_end_price)
          f.series(:name => "G_VVS1", :data => color_G_VVS1_end_price)
          f.series(:name => "G_VVS2", :data => color_G_VVS2_end_price)
          f.series(:name => "G_VS1", :data => color_G_VS1_end_price)
          f.series(:name => "G_VS2", :data => color_G_VS2_end_price)
          f.series(:name => "G_SI1", :data => color_G_SI1_end_price)
          f.series(:name => "G_SI2", :data => color_G_SI2_end_price)
          
          #H_
          f.series(:name => "H_IF", :data => color_H_IF_end_price)
          f.series(:name => "H_VVS1", :data => color_H_VVS1_end_price)
          f.series(:name => "H_VVS2", :data => color_H_VVS2_end_price)
          f.series(:name => "H_VS1", :data => color_H_VS1_end_price)
          f.series(:name => "H_VS2", :data => color_H_VS2_end_price)
          f.series(:name => "H_SI1", :data => color_H_SI1_end_price)
          f.series(:name => "H_SI2", :data => color_H_SI2_end_price)
          
          #I_
          f.series(:name => "I_IF", :data => color_I_IF_end_price)
          f.series(:name => "I_VVS1", :data => color_I_VVS1_end_price)
          f.series(:name => "I_VVS2", :data => color_I_VVS2_end_price)
          f.series(:name => "I_VS1", :data => color_I_VS1_end_price)
          f.series(:name => "I_VS2", :data => color_I_VS2_end_price)
          f.series(:name => "I_SI1", :data => color_I_SI1_end_price)
          f.series(:name => "I_SI2", :data => color_I_SI2_end_price)
          
          #J_
          f.series(:name => "J_IF", :data => color_J_IF_end_price)
          f.series(:name => "J_VVS1", :data => color_J_VVS1_end_price)
          f.series(:name => "J_VVS2", :data => color_J_VVS2_end_price)
          f.series(:name => "J_VS1", :data => color_J_VS1_end_price)
          f.series(:name => "J_VS2", :data => color_J_VS2_end_price)
          f.series(:name => "J_SI1", :data => color_J_SI1_end_price)
          f.series(:name => "J_SI2", :data => color_J_SI2_end_price)
          
          #K_
          f.series(:name => "K_IF", :data => color_K_IF_end_price)
          f.series(:name => "K_VVS1", :data => color_K_VVS1_end_price)
          f.series(:name => "K_VVS2", :data => color_K_VVS2_end_price)
          f.series(:name => "K_VS1", :data => color_K_VS1_end_price)
          f.series(:name => "K_VS2", :data => color_K_VS2_end_price)
          f.series(:name => "K_SI1", :data => color_K_SI1_end_price)
          f.series(:name => "K_SI2", :data => color_K_SI2_end_price)
          
          #L_
          f.series(:name => "L_IF", :data => color_L_IF_end_price)
          f.series(:name => "L_VVS1", :data => color_L_VVS1_end_price)
          f.series(:name => "L_VVS2", :data => color_L_VVS2_end_price)
          f.series(:name => "L_VS1", :data => color_L_VS1_end_price)
          f.series(:name => "L_VS2", :data => color_L_VS2_end_price)
          f.series(:name => "L_SI1", :data => color_L_SI1_end_price)
          f.series(:name => "L_SI2", :data => color_L_SI2_end_price)
          
          #M_
          f.series(:name => "M_IF", :data => color_M_IF_end_price)
          f.series(:name => "M_VVS1", :data => color_M_VVS1_end_price)
          f.series(:name => "M_VVS2", :data => color_M_VVS2_end_price)
          f.series(:name => "M_VS1", :data => color_M_VS1_end_price)
          f.series(:name => "M_VS2", :data => color_M_VS2_end_price)
          f.series(:name => "M_SI1", :data => color_M_SI1_end_price)
          f.series(:name => "M_SI2", :data => color_M_SI2_end_price)
          
          
          f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
          f.chart(type: 'line', height: 600)
          # f.chart({:defaultSeriesType=>"column"})
    
        elsif color != "all" and clar == "all"
          f.title(:text => "Diamond Price Chart #{weight}カラット")
          f.xAxis(:categories => group_IF_date)
          f.yAxis(:title => { text: 'Diamond Price($)' })
          
          f.series(:name => "#{color}_IF", :data => if_end_price)
          f.series(:name => "#{color}_VVS1", :data => if_end_price)
          f.series(:name => "#{color}_VVS2", :data => vvs2_end_price)
          f.series(:name => "#{color}_VS1", :data => vs1_end_price)
          f.series(:name => "#{color}_VS2", :data => vs2_end_price)
          f.series(:name => "#{color}_SI1", :data => si1_end_price)
          f.series(:name => "#{color}_SI2", :data => si2_end_price)
          
          f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
          f.chart(type: 'line', height: 600)
   
        elsif  color != "all" and clar != "all"
          f.title(:text => "Diamond Price Chart #{weight}カラット")
          f.xAxis(:categories => group_IF_date)
          f.yAxis(:title => { text: 'Diamond Price($)' })
          
          f.series(:name => "#{color}_#{clar}", :data => clar_end_price)
          f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
          f.chart(type: 'line', height: 600)
      
      end
    end  
    
  end
  
  private
  def diamond_params
    params.require(:diamond).permit(:date, :weight, :clar, :end_price, :color, :cut_grade, :rapnet_list_price, 
                                    :rapnet_discount, :price_per_carat, :polish, :symmetry, :fluorescen)
  end
  
  
  
  
  
end
