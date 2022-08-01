# Cryptobook
CryptoBook is a social media platform where users can have crypto-related conversations. Users can also use CryptoBook as a marketplace since we allow users to trade cryptocurrencies on this platform. 

<p align="center">
  <img src="https://media3.giphy.com/media/ROUmr1YyIB2YeymFZx/giphy.gif" alt="animated" />
</p>

Some features on our platform includes:
- News Feed to display new posts
- Feature to create new post
- Feature to search for posts (by cryptocurrencies being traded, by name of post owner, by number of minimum likes, find post with most like counts)
- Feature to see transactions being made in the market & market price
- Users can update their profiles, credentials, add banking info, etc.

## Tech stacks
- JavaScript
- NodeJS
- MySQL

## To do

- **Home:** 
- [ ] Fix like button (minus number of likes + delete from likeEvent table) - can't fix
- [ ] Buy & sell button (extra feature)
- [x] Display post type (buy/sell) + price + crypto
- [x] Fix delete - currently not working after hooking to new database (check back-end with new database) (delete on cascade)
- [x] Update according to database
- [x] CSS styling

- **My Settings:** 
- [x] password changed and updated 
- [x] Database updated according to the changes and updates
- [x] user Information displayed including (Name, Email, Following Count, Follower Count, UserID, userName)
- [x] userName changed and updated
- [x] personal profile displayed
- [x] CSS styling

- **Create post:**
- [ ] Check back-end to update with new database (required)

- **Search Post:**
- [x] Add displaying options for Search by Like (required)
- [x] Update display of post result after fixing post display in Home page
- [x] CSS Styling

- **Testing:**
- [ ] Add test data for demo screenshots
- [x] Add demo screenshot for Delete cascade

## Getting started:
- Set up client:
```
cd client
npm i -g yarn
npm i
```

- Set up server:
```
cd server
npm i
```

## Running:
- Run client:
```
yarn start
```
- Run server:
```
npm run dev
```
