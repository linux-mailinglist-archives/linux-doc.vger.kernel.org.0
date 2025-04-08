Return-Path: <linux-doc+bounces-42615-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B7A80E93
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 16:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC2E3420462
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 14:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7307230BF4;
	Tue,  8 Apr 2025 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f9n3zqTN"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C8222D784;
	Tue,  8 Apr 2025 14:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122772; cv=none; b=fsWCxgFZbg7aES6sVWMh54Yxhgfxz0cQgECcbeW6TMfIc7Re3tUJACu9G8pfGx0i/S3RTjZ+Y+KIhYSe9ipIiQxjlqaL5QDux8QYhIdOUJE0bBId06GXpcjNzN5t3FJqi/6wxblf3kOnoRnXvfFrnH9HJUP9KYkieIG0TCr526o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122772; c=relaxed/simple;
	bh=fdLBJz3XfsfY4TPnyBshtFiMS/5KSmrv/6AScwZObXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qknFHLXHQj9ht2VkSRFQrbgVkgOYEfGBqNB19cZTctiFMpcUmHd+C4uYegcjtQEDj7kU3M4uoHmpsj+7LXMitKRQrEUJJMchzSG7qPykekVE4g3UPPNx6PHsPQdFs8cAfNOjTg/FuC2w7rTGYkcJ9NDsmsxFO87HlnAEENtzIlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f9n3zqTN; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE716441D6;
	Tue,  8 Apr 2025 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744122766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFEefeZamBor0b/TGmFIcJZdU44c/sbmnuWd9h4THL8=;
	b=f9n3zqTNh/uGxCLblawqqK2gP4/cgXksZ11B93vMKW572eRljAOqgqPL2VQOny6DzaQG0i
	FvtYZ7cEDBmJWmP/eOSmch2CPMLf0Xr35frdSxbGaS+cJhVjzF9wlaJ0Qd2pMstmEVOhth
	Yg0kJsdUu2QXxnf+dQs3dF5xfPrvymYooMdMVnQNxLOXXefrDYTNYqfZEGqr2yFSJaI8OF
	UkfDZMNBDwi97vw7pv2rdnFhQIgm84WXFDdIlXhbBsxCDgKOeo5MOzswhIToYh1bZ0dxfl
	u9lt4bJRArNbRkBYO3nthbhd0lxr5268hxA+XQ69bddzDdAgvsiW+BVFs9nr8w==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 08 Apr 2025 16:32:20 +0200
Subject: [PATCH net-next v7 11/13] dt-bindings: net: pse-pd:
 microchip,pd692x0: Add manager regulator supply
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-feature_poe_port_prio-v7-11-9f5fc9e329cd@bootlin.com>
References: <20250408-feature_poe_port_prio-v7-0-9f5fc9e329cd@bootlin.com>
In-Reply-To: <20250408-feature_poe_port_prio-v7-0-9f5fc9e329cd@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Oleksij Rempel <o.rempel@pengutronix.de>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Donald Hunter <donald.hunter@gmail.com>, 
 Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Simon Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>, 
 Dent Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Kory Maincent (Dent Project)" <kory.maincent@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkhihlvgdrshifvghnshhonhesvghsthdrthgvtghhpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughonhgrlhgurdhhuhhnthgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehordhrvghmphgvlhesphgvnhhguhhtrhhonhhig
 idruggvpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>

Adds the regulator supply parameter of the managers.
Update also the example as the regulator supply of the PSE PIs
should be the managers itself and not an external regulator.

Signed-off-by: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v5:
- Add description of others power supplies.

Changes in v3:
- New patch
---
 .../bindings/net/pse-pd/microchip,pd692x0.yaml     | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml b/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml
index fd4244fceced..ca61cc37a790 100644
--- a/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml
+++ b/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml
@@ -22,6 +22,12 @@ properties:
   reg:
     maxItems: 1
 
+  vdd-supply:
+    description: Regulator that provides 3.3V VDD power supply.
+
+  vdda-supply:
+    description: Regulator that provides 3.3V VDDA power supply.
+
   managers:
     type: object
     additionalProperties: false
@@ -68,6 +74,15 @@ properties:
           "#size-cells":
             const: 0
 
+          vmain-supply:
+            description: Regulator that provides 44-57V VMAIN power supply.
+
+          vaux5-supply:
+            description: Regulator that provides 5V VAUX5 power supply.
+
+          vaux3p3-supply:
+            description: Regulator that provides 3.3V VAUX3P3 power supply.
+
         patternProperties:
           '^port@[0-7]$':
             type: object
@@ -106,10 +121,11 @@ examples:
           #address-cells = <1>;
           #size-cells = <0>;
 
-          manager@0 {
+          manager0: manager@0 {
             reg = <0>;
             #address-cells = <1>;
             #size-cells = <0>;
+            vmain-supply = <&pse1_supply>;
 
             phys0: port@0 {
               reg = <0>;
@@ -161,7 +177,7 @@ examples:
             pairset-names = "alternative-a", "alternative-b";
             pairsets = <&phys0>, <&phys1>;
             polarity-supported = "MDI", "S";
-            vpwr-supply = <&vpwr1>;
+            vpwr-supply = <&manager0>;
           };
           pse_pi1: pse-pi@1 {
             reg = <1>;
@@ -169,7 +185,7 @@ examples:
             pairset-names = "alternative-a";
             pairsets = <&phys2>;
             polarity-supported = "MDI";
-            vpwr-supply = <&vpwr2>;
+            vpwr-supply = <&manager0>;
           };
         };
       };

-- 
2.34.1


