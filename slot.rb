class Games
  
  def initialize(coin=100, point=0)
    @coin = coin
    @point = point
    @status = "continue"
  end
  
  def play_slot  # スロットゲームを1回プレイする
    bet = 0
    rate = 0
    getpoint = 0
    pip = Array.new(3) { Array.new(3) }
    
    while bet == 0 || (@coin - bet < 0) do
      puts "コインが足りません" if (@coin - bet < 0)
      puts "残りコイン数: #{@coin}"
      puts "ポイント: #{@point}"
      puts "何コイン入れますか?"
      puts "1(10コイン) 2(30コイン) 3(50コイン) 4(やめとく)"
      choices = gets.to_i
      case choices
      when 1
        bet = 10
      when 2
        bet = 30
      when 3
        bet = 50
      when 4
        return @status = "finish" # メソッドを抜ける
      end
    end
    @coin -= bet
    puts "-----------------------------"
    puts "エンターを3回押しましょう!"
    step_1 = gets
    pip[0] = [rand(9), rand(9), rand(9)]
    puts "-----------------------------"
    puts "|#{pip[0][0]}|#{pip[1][0]}|#{pip[2][0]}|"
    puts "|#{pip[0][1]}|#{pip[1][1]}|#{pip[2][1]}|"
    puts "|#{pip[0][2]}|#{pip[1][2]}|#{pip[2][2]}|"
    puts ""
    step_2 = gets
    pip[1] = [rand(9), rand(9), rand(9)]
    puts "-----------------------------"
    puts "|#{pip[0][0]}|#{pip[1][0]}|#{pip[2][0]}|"
    puts "|#{pip[0][1]}|#{pip[1][1]}|#{pip[2][1]}|"
    puts "|#{pip[0][2]}|#{pip[1][2]}|#{pip[2][2]}|"
    puts ""
    step_3 = gets
    pip[2] = [rand(9), rand(9), rand(9)]
    puts "-----------------------------"
    puts "|#{pip[0][0]}|#{pip[1][0]}|#{pip[2][0]}|"
    puts "|#{pip[0][1]}|#{pip[1][1]}|#{pip[2][1]}|"
    puts "|#{pip[0][2]}|#{pip[1][2]}|#{pip[2][2]}|"
    puts ""
    puts "-----------------------------"
    if pip[0][0] == pip[0][1] && pip[0][1] == pip[0][2]
      rate += 1
      puts "左の列が揃いました!"
    end
    if pip[1][0] == pip[1][1] && pip[1][1] == pip[1][2]
      rate += 1
      puts "真ん中の列が揃いました!"
    end
    if pip[2][0] == pip[2][1] && pip[2][1] == pip[2][2]
      rate += 1
      puts "右の列が揃いました!"
    end
    if pip[0][0] == pip[1][0] && pip[1][0] == pip[2][0]
      rate += 1
      puts "上の行が揃いました!"
    end
    if pip[0][1] == pip[1][1] && pip[1][1] == pip[2][1]
      rate += 1
      puts "真ん中の行が揃いました!"
    end
    if pip[0][2] == pip[1][2] && pip[1][2] == pip[2][2]
      rate += 1
      puts "下の行が揃いました!"
    end
    if pip[0][0] == pip[1][1] && pip[1][1] == pip[2][2]
      rate += 1
      puts "斜めが揃いました!"
    end
    if pip[0][2] == pip[1][1] && pip[1][1] == pip[2][0]
      rate += 1
      puts "斜めが揃いました!"
    end
    getpoint = bet * rate * 10  # 獲得ポイント= 入れたコイン * 揃った数 * 10
    if rate == 0
      puts "ポイントを獲得できませんでした..."
    else
      puts "獲得ポイント: (入れたコイン) #{bet} × (揃った数) #{rate} × 10 = #{getpoint}"
    end
    puts ""
    @point += getpoint
    if @coin < 10
      @status = "finish"
      puts "コインが10を下回ったので終了です"
    end
  end
  
  
  def evaluate  # スロットゲームの結果を表示する
    puts "============================="
    puts "最終結果"
    puts "合計ポイント: #{@point}   残りコイン: #{@coin}"
    puts "============================="
  end
  
  
  def roop_slot  # スロットゲームを繰り返しプレイする
    while @status == "continue" do
      play_slot
    end
    evaluate
  end

end


game = Games.new()
game.roop_slot