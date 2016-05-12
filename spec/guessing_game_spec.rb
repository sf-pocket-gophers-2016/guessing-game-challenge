require_relative '../guessing_game'

describe GuessingGame do
  let(:game) { GuessingGame.new(8, 5) }
  let(:losing_game) { GuessingGame.new(999, 1) }
  let(:winning_game) { GuessingGame.new(100, 2) }

  it 'sets a custom congrats message' do
    expect(game.congrats_message).to eq "Yay, you won!"
    game.congrats_message = "Correct!"
    expect(game.congrats_message).to eq "Correct!"
  end

  it "There will be 5 guesses remaining in game 1" do
    expect(game.remaining_guesses).to eq 5
  end

  it "There will be 1 guess remaining in game 2" do
    expect(losing_game.remaining_guesses).to eq 1
  end

  it "User has neither won nor lost yet" do
    expect(game.has_won?).to be false
    expect(game.has_lost?).to be false
  end

  it "Wrong guess receives correct feedback" do
    expect(game.guess(2)).to eq "Too low!"
  end

  it "Wrong guess deducts from remaining guesses" do
    game.guess(2)
    expect(game.remaining_guesses).to eq 4
  end

  it "Repeated guesses do not cost the user anything" do
    expect(game.guess(2)).to eq "Too low!"
    game.guess(2)
    expect(game.remaining_guesses).to eq 4
  end

  it "Wrong guess receives feedback" do
    expect(game.guess(11)).to eq "Too high!"
  end

  it "Wrong guess deducts from remaining guesses" do
    game.guess(2)
    game.guess(11)
    expect(game.remaining_guesses).to eq 3
    expect(game.guess(10)).to eq "Too high!"
    expect(game.remaining_guesses).to eq 2
  end

  it "Warning is given when there's only one guess remaining" do
    game.guess(2)
    game.guess(11)
    game.guess(10)
    expect(game.guess(9)).to eq "Too high! WARNING: Only one guess left!"
  end

  it "Repeated guess when 1 guess is remaining should have warning" do
    game.guess(2)
    game.guess(11)
    game.guess(10)
    game.guess(9)
    expect(game.guess(9)).to eq "Too high! WARNING: Only one guess left!"
  end

# make deep copy of game 1 to test losing
let(:copied_game) { Marshal.load(Marshal.dump(game)) }

it "Correct guess gets feedback for the custom congrats message" do
   game.congrats_message = "Correct!"
  expect(game.guess(8)).to eq "Correct! The number was 8"
  expect(winning_game.guess(100)).to eq "Yay, you won! The number was 100"
end

it "Losing games get a loss message" do
  expect(losing_game.guess(9)).to eq "You lost! The number was 999"
  game.guess(2)
    game.guess(11)
    game.guess(10)
    game.guess(9)
  expect(copied_game.guess(123)).to eq "You lost! The number was 8"
end

# it "Guesses on completed games show the status of the game" do
#   p (game.guess(8) == "You already won. The number was 8")
#   p (game.guess(9) == "You already won. The number was 8")
#   p (winning_game.guess(0) == "You already won. The number was 100")
#   p (losing_game.guess(999) == "You already lost. The number was 999")
#   p (losing_game.guess(111) == "You already lost. The number was 999")
# end
# it "Guesses on completed games do not alter remaining_guesses" do
#   p (game.remaining_guesses == 0)
#   p (winning_game.remaining_guesses == 1)
#   p (losing_game.remaining_guesses == 0)
# end
# it "Outcome is recorded correctly for won game" do
#   p (game.has_won? == true)
#   p (game.has_lost? == false)
# end
# it "Outcome is recorded correctly for lost game" do
#   p (losing_game.has_won? == false)
#   p (losing_game.has_lost? == true)
# end


end
