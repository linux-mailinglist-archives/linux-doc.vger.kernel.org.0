Return-Path: <linux-doc+bounces-13165-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADDC892FE8
	for <lists+linux-doc@lfdr.de>; Sun, 31 Mar 2024 10:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1288E2810A5
	for <lists+linux-doc@lfdr.de>; Sun, 31 Mar 2024 08:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A02132C3F;
	Sun, 31 Mar 2024 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DNoYWyHJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452712FB27
	for <linux-doc@vger.kernel.org>; Sun, 31 Mar 2024 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711874705; cv=none; b=qYZb6MhKWYP1/9jyUhqlOHoOjQJQVYuGrtev/9R7cO5ya5iDR+4xfZJYsy0qcql1TwdYa99P65DM+GNrKYiJGff1XqxlNnibGQ0MeJgbW8d5pGWlLM6O2leWppKqx64ggloG7MJIUjz5UwftLIGNZZsDgwyZbrPH7bfZebylm6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711874705; c=relaxed/simple;
	bh=RVE008LGGmmk5WXgZGxtm6p/ays+12n/AyoNVnX9umo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzWZV/vv8uUAvFTVCKeL/uYCOttlbuFbB8Ahivi9Q7653Ks3SoC8C3M5aixGqoq/W0BCMVpHpqK9DsxB2rl/RG8i2A5UwBmvyTNUYRoQWjBHOPDvbT8XmOOiMKDDE/4FjIupLbj3Dh5lBDuuCeUgBnNliFGft4tM6e9SwN2bjZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DNoYWyHJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-341730bfc46so2348790f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 31 Mar 2024 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874700; x=1712479500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vBka3ABZcniwH/u8QWX2xHT7esEXtapMcD7AcTvpic=;
        b=DNoYWyHJ8J5x9aeegsIQdYfuR+pUtGOIZaDW+vLRmEzXdniU/II/1On0ol2Znb9IEC
         01Hth+hIIJZ4CIJ60JSan1gNv9kpEkfA4fzO3Ts68wPrXuSibE/avlv7eLf3POAOpze8
         zeZ8QZRKMem9zB118yhh22By14OAMRcAdQbnVE2WEAOxatNlb+eKczU0XlxTzTtjMwpO
         LKATGDhlfKWFDcmbHFAncRYkA8+fxHYhPC/MDEADC61HSgyOJB1LyQ8gQYaI5S/KD85q
         sLXkD589YwokIvcx7i38JucUwY99QMkj8DWF0RlMwTxEoMwmc1QrsSwymHk9+yU52y4+
         o5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874700; x=1712479500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vBka3ABZcniwH/u8QWX2xHT7esEXtapMcD7AcTvpic=;
        b=J5i8PMnajnpu4IY50vUD2HR/7P/Y6e5mOcGG4blxu7SBs99oniq2xUSjaOSx02s775
         p0RPGIfpVX5309cNloStxKQ5+MnpO78PLT/Ob1HYKrEFOkHweb7mtTEsDIyYCZh6qFMi
         FIWE52cqaShYcmJPUps+k1ZB3DKLZBTwbhS1R/lXjBjIMge3/0vRhefNAxVSE0L/0+zR
         XDw3Sox0qYanuCxbJwAsnuYqRzDdpfG81tSH8b2s20kI80btguRy1JMHQE2XaNHgvxo9
         jSupEqO/ALN8idpj88fhI9so6bCQZ4o2dz5P/O238jOBBX4Nwt3ODUz+SYBpO3AieQdm
         iwBw==
X-Forwarded-Encrypted: i=1; AJvYcCXisTll5aBuYUs11RpbGH54WBIOuVahV1A2oJO7t4nTb4GDNxQmMeHqIlK7caBMF0ggBQtiBNgL2anwG+TB4VOIIaZ9UOA1thdC
X-Gm-Message-State: AOJu0Yy0UFhSlJQUM3dniVtBgtUzGDOX6MRW3+risYI1EkPuZbK2QUEP
	0mvdy4A1SVBTh8Z+CsUTZSZ3BD7xNVV8TFS16RTgHAiaAfBsgBpTMLJjOe0tC+w=
X-Google-Smtp-Source: AGHT+IGHu2FLUbvwsuKAjPidSr353dvDp7GuCk2BJH42ai3YiGwqE+E/4IAqydG6le1xjhRiCRJmlw==
X-Received: by 2002:a5d:4246:0:b0:341:bf35:5088 with SMTP id s6-20020a5d4246000000b00341bf355088mr3888713wrr.52.1711874700246;
        Sun, 31 Mar 2024 01:45:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:44:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:54 +0200
Subject: [PATCH v2 07/25] bluetooth: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-7-98f04bfaf46a@linaro.org>
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
In-Reply-To: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Alexander Graf <graf@amazon.com>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, 
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev, 
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=797;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RVE008LGGmmk5WXgZGxtm6p/ays+12n/AyoNVnX9umo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJWgux1UKxOir90nq5+7EUMXVeKU7DwLrCzk
 Bafs1coq9uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiVgAKCRDBN2bmhouD
 15K8EACUu9gS/2wREcsuKbu+4sGKqkB6ND2x9NAo7i3nS2L/g7FIP1Gc2f2b1l8GlP/qgmcBRbN
 TJjhPbgppsLyX5MMxYZertsyVFSDRJBiGa3jDd8mSsTsoYqXIt2UoVs3ZeO2Jki+GcyhW32Pgld
 m26G72p2dXSd3XuTzpVDgu3bOz34rS+9oLDdRYLTX7+To0LTokkqgw/e/+xMhymvX829JWhBVnH
 /dt3ZSSONvJohlbPbFwK76FJmeWWcXhZtc9Gh6gM5CWsPWu5dH18kKxnzKLVvCLsy3mmuaAiZFG
 6RwnaAnltaplfrZ1DDLtUO6vPioQnE1Fm30MZy3AU9bmL9q6+Dz8OllTFWiQNp5V6TyvPbjwNG4
 5PB7mKgdP89TmkRPG1O/jdnh/ZuvWyId6soz08SjKDH11xgp2rB4OUqCXiBBxPVG3uSkB8tCopY
 KsZe6kFLp18/n+fx5upudyi72boGRNmz29kOvLkwQv3WMSb3Yd5t7r1stSxwLbCzkFW6jRc2x+e
 DWXW3ZLyHFjkYGy2XwPdkGs/ERm+7prUHx/AKf5MOHewCtJKunxib85KPyF1E9qXwxjhL95S5eK
 z+nGbNkOAyQC1HwpKNQz+jh76cI3BSefUT0gDs+XTiN/JnmB1sg06tEJ98+Ed1Gym7uUR9QUMXw
 52ZuE329cJlElMQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/bluetooth/virtio_bt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/virtio_bt.c b/drivers/bluetooth/virtio_bt.c
index 2ac70b560c46..463b49ca2492 100644
--- a/drivers/bluetooth/virtio_bt.c
+++ b/drivers/bluetooth/virtio_bt.c
@@ -417,7 +417,6 @@ static const unsigned int virtbt_features[] = {
 
 static struct virtio_driver virtbt_driver = {
 	.driver.name         = KBUILD_MODNAME,
-	.driver.owner        = THIS_MODULE,
 	.feature_table       = virtbt_features,
 	.feature_table_size  = ARRAY_SIZE(virtbt_features),
 	.id_table            = virtbt_table,

-- 
2.34.1


