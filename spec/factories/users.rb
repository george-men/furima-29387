FactoryBot.define do
  factory :user do
    nickname { 'テック' }
    email { 'www.abab@co.jp' }
    password { 'tech1212' }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '太郎' }
    fam_reading { 'ヤマダ' }
    fir_reading { 'タロウ' }
    birth_date { '1930-01-01' }
  end
end
