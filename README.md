# Cryptobook

To do:

settings page
profile page
loggedIn weird bug
Followers
Transaction

## To do
### Post-related part:

- **Home:** 
- [ ] Fix like button (minus number of likes + delete from likeEvent table) - can't fix
- [ ] Buy & sell button (extra feature)
- [x] Display post type (buy/sell) + price + crypto
- [x] Fix delete - currently not working after hooking to new database (check back-end with new database) (delete on cascade)
- [x] Update according to database
- [x] CSS styling

- **My Settings:** 
- [] password changed and updated 
- [ ] Database updated according to the changes and updates
- [x] user Information displayed including (Name, Email, Following Count, Follower Count, UserID, userName)
- [x] userName changed and updated
- [ ] personal profile displayed
- [ ] CSS styling

- **Create post:**
- [ ] Check back-end to update with new database (required)

- **Search Post:**
- [ ] Create a drop-down menu to show only 1 search option at once (extra)
- [ ] Add displaying options for Search by Like (required)
- [x] Update display of post result after fixing post display in Home page
- [x] CSS Styling

- **Testing:**
- [ ] Add test data for demo screenshots
- [ ] Add demo screenshot for Delete cascade

## Getting started:
- Set up client:
```
cd client
npm i -g yarn
npm i
yarn start
```

- Set up server:
```
cd server
npm i
npm run dev
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
