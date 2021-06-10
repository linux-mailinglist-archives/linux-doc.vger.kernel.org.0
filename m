Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3AF3A326E
	for <lists+linux-doc@lfdr.de>; Thu, 10 Jun 2021 19:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhFJRtl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Jun 2021 13:49:41 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:40133 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230205AbhFJRtk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 13:49:40 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7440658062B;
        Thu, 10 Jun 2021 13:47:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 10 Jun 2021 13:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm3; bh=DCVQl0+vVt26JQR+litM6q5/la
        B8t6MAbnmth36F00w=; b=D5JsNCaBA3BVFaaQlD2SAFJAa8qdvra/xA0Fa049Vd
        rGYT3HsWI1venA2JRkdV4AFdAlbHo+xReJ7g8msV1X1iXJvphPJW+bn1MfrcHE4X
        ilf5mE7JMrqFy2kvobkj2epe6YYgqA5bHGxrAMO4aHmxM+eMGnX81zEnOsZfVZ+K
        7g98j7P27svBNHQynEvGzk2qLW+PHvTCBftPZpHhg+UMXjm3gYO69kfpIjXO3jwW
        mSUMTkTuQj52hkn2Zm9LceKdOR5vLzrfb8w0cuRYArQRkUkVUmkl6i45qToth8XU
        C4YLstju0se4i8wAPoKIjoD0RnnANJMPjG3O7BwHZNFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DCVQl0
        +vVt26JQR+litM6q5/laB8t6MAbnmth36F00w=; b=CgOKD3T7hzwZPBtIF7IRLN
        nvkcgMBn2idyXnv01YO2usHfUfn5znavbSIU0rnjxe2ZHEJLHDnHRHsYTRyMk4g/
        pfBuKoQjmE89+c7Mkbj0Cr+4xGHBH/PlIQCUN7lJ3wJbfCoIJlm8C2ACq6hFEF2a
        lF+17o/Y9Mq6ol+8TZlw6cTDUsAlmKLioMuairtfHMMCmN2X9FxxX1HUxSG7IrX0
        ychN30HqqmXZm8GG8LbXUK7bqReJWxsvjX5RrC96MBZSj78bijo7kqgbzfvcyh+f
        4cvZqRE59wL/kpd8gnmvy7SLNoFfzcHcQG3XWDScxcoZd+h6xJEqnbY/aRLiSuJQ
        ==
X-ME-Sender: <xms:NlDCYFXx33qtFoiyxhBowC5_2kXnswvZIC1_97djyzbKfc6XEYKjqQ>
    <xme:NlDCYFk7fvydTVjZdg-CO4GE4CKjYLmyTRobIBddvHsVVdmamhhYemn07WFTLlOD3
    E3DXtVU1wsHRLk_oTw>
X-ME-Received: <xmr:NlDCYBaTfcakVYeCot42H4-Hqaa7ESVDq6mbeqN37OQp4s9bFlrCeRa3k4x1-fMMHv0OWE2RLJzyNLPyffcqiF8mW1QaRA21FZlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedufedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhephedvgfeujefgfefhleefjedtteduvdfftdetgffgfedtgfffkeelfeejvdeg
    iefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NlDCYIXQyEao_nOcF1lRPKazpgyWbEMcXWOybikbAZ7D6RNd3XycYA>
    <xmx:NlDCYPkKuFumBa0ciemfq06y-ObTL2B4Gr1ZNP4ptcZ2gKBID_tF6Q>
    <xmx:NlDCYFf-qvM-9KXys_1VMaSW9Oxcr9sKDD0QrKrh8b6VMLElBnmCEQ>
    <xmx:P1DCYPl--JDFEfArs2U3zEp2g6LC3RBd0L-tfjaA8OzA1cCvjxPRvQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 13:47:34 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Alison Wang <alison.wang@nxp.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Brian Starkey <brian.starkey@arm.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Eric Anholt <eric@anholt.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Huang Rui <ray.huang@amd.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        John Stultz <john.stultz@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Marek Vasut <marex@denx.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Melissa Wen <melissa.srw@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Russell King <linux@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Steven Price <steven.price@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Zack Rusin <zackr@vmware.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3] Documentation: gpu: Mention the requirements for new properties
Date:   Thu, 10 Jun 2021 19:47:31 +0200
Message-Id: <20210610174731.1209188-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

New KMS properties come with a bunch of requirements to avoid each
driver from running their own, inconsistent, set of properties,
eventually leading to issues like property conflicts, inconsistencies
between drivers and semantics, etc.

Let's document what we expect.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alison Wang <alison.wang@nxp.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Edmund Dea <edmund.j.dea@intel.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sean Paul <sean@poorly.run>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Zack Rusin <zackr@vmware.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v2:
  - Take into account the feedback from Laurent and Lidiu to no longer
    force generic properties, but prefix vendor-specific properties with
    the vendor name

Changes from v1:
  - Typos and wording reported by Daniel and Alex
---
 Documentation/gpu/drm-kms.rst | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 87e5023e3f55..bbe254dca635 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -463,6 +463,33 @@ KMS Properties
 This section of the documentation is primarily aimed at user-space developers.
 For the driver APIs, see the other sections.
 
+Requirements
+------------
+
+KMS drivers might need to add extra properties to support new features.
+Each new property introduced in a driver need to meet a few
+requirements, in addition to the one mentioned above.:
+
+- Before the introduction of any vendor-specific properties, they must
+  be first checked against the generic ones to avoid any conflict or
+  redundancy.
+
+- Vendor-specific properties must be prefixed by the vendor's name,
+  following the syntax "$vendor:$property".
+
+- Generic properties must be standardized, with some documentation to
+  describe how the property can be used.
+
+- Generic properties must provide a generic helper in the core code to
+  register that property on the object it attaches to.
+
+- Generic properties content must be decoded by the core and provided in
+  the object's associated state structure. That includes anything
+  drivers might want to precompute, like :c:type:`struct drm_clip_rect
+  <drm_clip_rect>` for planes.
+
+- An IGT test should be submitted.
+
 Property Types and Blob Property Support
 ----------------------------------------
 
-- 
2.31.1

