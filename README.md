# Chợ Phiên 2D

A 2D browser game: you control a character strolling between the 8 stalls of a Vietnamese country market, browse products, chat, and meet other players.

**Play it:** https://cho-phien-2d.netlify.app

> The in-game text (stall names, shopkeeper lines, buttons) is in Vietnamese, because the players are Vietnamese. Code comments and documentation are in English.

## Features

- **8 stalls** (Áo Quần = clothes, Giày Dép = shoes, Phụ Kiện = accessories, Mỹ Phẩm = cosmetics, Đồ Ăn = food, Nước Uống = drinks, Trái Cây = fruit, Bánh Kẹo = sweets). Each has its own roof, walls and display, and a shopkeeper who greets customers and calls out goods.
- **Product popup** with a product list and a detail page (description, options, Shopee/TikTok buy buttons to be wired up later).
- **Character creator:** name, name colour, status, pet, skin, hair, shirt, pants, hat.
- **Day and night on Vietnam time.** The night market is lit up, and some stalls close late at night.
- **4 themes:** Tet, Mid-Autumn, Christmas, Rainy season (changed only when the player picks one).
- **Sound** synthesized with Web Audio: effects, ambience and background music per theme.
- **Controls:** keyboard (WASD, arrow keys), tap/click on the map, or a virtual joystick on phones.
- **Multiplayer:** players see each other move and can chat.

## Run locally

The game is a single file and needs no build step:

```bash
# open it directly
xdg-open index.html

# or serve it with any static server
python3 -m http.server 8080
```

## Controls

| Action | Desktop | Phone |
|---|---|---|
| Move | WASD / arrow keys / click the map | Joystick or tap the map |
| Enter a stall | `E` or click the stall | Yellow "Vào gian" (enter stall) button |
| Character | `C` | "Nhân vật" (character) button |
| Scene (day/night, theme, sound) | `T` | The clock button at the top right |
| Chat | `Enter` | The 💬 button |

## Multiplayer

The game uses a **public MQTT broker** as a relay, so no server of our own is needed. Open the link with `?room=group-name` to play privately with a group:

```
https://cho-phien-2d.netlify.app/?room=team-a
```

Anyone who opens the same room name sees each other. Without `?room=`, everyone joins the default room `main`.

> A public broker comes with no uptime guarantee and is **not private**: anyone who knows the topic name can read and publish to it, so player names, positions and chat messages are exposed. It is fine for testing. For a real launch, move to our own WebSocket server (the networking code lives in the `Multiplayer` section of `index.html`).

## Deploy

The site is hosted on Netlify (`cho-phien-2d`). With the Netlify CLI logged in:

```bash
./deploy.sh "note for this deploy"
```

The script copies `index.html` into `dist/` and pushes it to production. Pushing to GitHub does not deploy by itself.

## Project layout

```
index.html     the whole game (HTML, CSS, JS, assets embedded as base64)
deploy.sh      deploy to Netlify
assets/        original Kenney assets (unpacked, kept as the source)
```

Product data lives in the `PRODUCTS` array in `index.html`. Each product already has an `img` field (image URL) and `links.shopee` / `links.tiktok` fields to fill in later.

## Credits

Character and market art uses free assets by [Kenney](https://kenney.nl) under the CC0 license:
[Tiny Town](https://kenney.nl/assets/tiny-town) and [Roguelike Characters](https://kenney.nl/assets/roguelike-characters).
