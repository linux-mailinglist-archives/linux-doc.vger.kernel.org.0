Return-Path: <linux-doc+bounces-12842-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC00288E592
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 15:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FD9B29C8E0
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 14:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC87A14F9F0;
	Wed, 27 Mar 2024 12:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWlcxziE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFC414F13E
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543570; cv=none; b=BnjUdmq38/SEea7kLdm57s+xfQkdewULP1zDtfU28/yxIl1NHOp1EHJBKdUsaW15y2zfIeQPDTKmgX7VMWUol4Ms9hm2j6AFN1pB+ry5CgnONJhYZB28dvYazqukhYORzyrs11Mz5t7GKjnCX57Uklh+yObE3k3MQapSZCVqg40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543570; c=relaxed/simple;
	bh=PP3MFzXOn0y5/ZwEiMfjnPaChdOWdaVsrRcHCUE4yLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=phZyRY8MD1Y5vIvFUgZ/dCgxUDUJ1rtyFtvIh+W0K9+TsVdRxjBS2v6vsTkPiReMHm1rTqBQlnDWHsc+TnC06JjRAtW6YvyL02NjKePejB0OdhW5ZLidt/9u773xo3uGQiZ/208hDe9uh4aQo7z3C41+C7nIQXNGiMnG7I1dVyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWlcxziE; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a46d0a8399aso142685766b.1
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543566; x=1712148366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcNHdYD3uD4iwF1+LVPcIdLIGHnCmbVJHNncy5BFB3I=;
        b=uWlcxziE/Wjh5Zfj4qXGg53NYVmYcVWVwsI8/0huXSadwmE/WEHGxsdxRkL+T+wW5r
         9hJtnMqfN0rHI+WWC9sOGrHwix7ZG4NBu98+7qrrnNcIUFlqJfOv2VzdLRHOJdyH+/pd
         MIsvr4rLhBn5/KKuR8Sk2RHRoGqtKFneQRadkIE0+nrtaimUS9sZuhBtR1CJK0TFYDct
         BBKOgrzvgmuIMvO5m9b8oJR27zHYsyFwUKisk8F+JhcJYD40i+mlrnLB0Ok3YgyZNOCB
         6eXxWkQ16fLnv80KuwfSY9x2mRlS3Si91iwioDeS2Fk68bs5+iSCU1qa4GnzOYz9FC7O
         dOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543566; x=1712148366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcNHdYD3uD4iwF1+LVPcIdLIGHnCmbVJHNncy5BFB3I=;
        b=IHwLrGo5xyAaoqsUx68xCjrun203hKDm1tkb0IVrg9XYXzw/jxbq7Y4IWp8ReViK1X
         V6qkIO+UYrzQ/LwSsPMa+nVOl7ktHnnFpnwy03v3lqffSujpjfslcb3S1kZtG6MYRv+U
         b8eWDtsZYiIFCxstexYz3z5/cmLZ9BOcJeJKA42DL9LCk6IgqHnpkqtunZF4uIsrCm64
         sxfY7ByeO9i6VbDDOpod7KtkFLmMs1xv9Pua3Vrc72RyJkj/5sFqvGQaBYAPh+jPow8D
         qyE5bnDZDvuTdIUmK63eujF1i/NVGqmskE27WJBV2g6boKgBtXiC/7cNvVyN8QXIN4Mv
         KH2g==
X-Forwarded-Encrypted: i=1; AJvYcCUjNpLf7ypkimiYqtKp0CEsQCNb+oGeC/ingNsNnkbAQBc6nYOtTl3lVJ2oqGR+A3GmERXKRl8HK7k50dan4TKKbTDG2Nz6CCn3
X-Gm-Message-State: AOJu0YzgHvkM7fHpUGWrV91vpH7go9K+GHKFrAMMRjxDV8FO7F4IgwY4
	tDCR/1yY9I8q22arCEG7KyO31YJphZ93u0SqBZdWJZVm4FUZKxuHRjlM/c4OxF8=
X-Google-Smtp-Source: AGHT+IHAC+efJDEDOhYYZLnuKsMBiAknK86hs9hU/6w4UJOwXzt8k36t0rLL/AgWFx4eJtux97baRA==
X-Received: by 2002:a17:906:f59b:b0:a4a:3b69:66a0 with SMTP id cm27-20020a170906f59b00b00a4a3b6966a0mr4448445ejd.15.1711543563860;
        Wed, 27 Mar 2024 05:46:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:46:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:07 +0100
Subject: [PATCH 14/22] net: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-14-0feffab77d99@linaro.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
In-Reply-To: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>, 
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
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=762;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PP3MFzXOn0y5/ZwEiMfjnPaChdOWdaVsrRcHCUE4yLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPmwe4wpkGjPDa9IFmmJcFy2OKytkeKyZycw
 AlSIQtS16KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5gAKCRDBN2bmhouD
 19PSD/4yYqnj7z8BE0lw7ekC4xjBS+K/SSYPbZXiZqpgBNKtouhjE+/EaLyosBVQkqSLvargvG3
 QvDJzvb+nLD+WwOT52wSDwliv/Ae6GMRPBktUiX3fy9Nh/bllS7ADKTbvP/TiLZwM7leQtI2FIs
 5IxOKcAEU8gKMzPRDjNOOPO3WnRTa7HFEdKo+w8XiIL7kDXbqw2Vrw2xNf5/PyXlwzIExznQF1g
 W+eh62On+nSjWkHoGEXv7siMDdiBirwvhQdVMblqjcqEt5iXLcJSOi1YF3fYR3Or5dKnNrFzotW
 TFCZhxdCDn6dAtcXHVgJdTmPOctZ2BbjU1yPjeSrslJTYFXeaJ3liX3KwbEavpey+KhfpASo/+J
 TZKxYxu4jdFzrf20lb6xcul2pIkjhiWbwfb1LmS49MB5yt1Fskt2SpyEJD6RboXT/rwXS4B71wP
 qHacI+KIAQM/iIDs/QZOUwZZsmZUnX4YEE7qP4x1HikiwuXVDHyPWmD+IyB7eMFi7KfG/CrJZPZ
 AaMeSmpbmQ/Fj0CY6hDkkVk1jDZoL0KmBSzdnG3Lpe75Q/Ff8KH4KrreNx4Vjgye4U3pwPbri1D
 5GO5i9hy1NoZ9fg08cBB5IjQ0jbJ2Z5q5f2VOJuPwH4FZLcJ0w9UA6H0Ctr0KCBBevGH7HtNyCD
 hiQIZRQ3pYjK6fw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/net/virtio_net.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index c22d1118a133..61f680699648 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -5021,7 +5021,6 @@ static struct virtio_driver virtio_net_driver = {
 	.feature_table_legacy = features_legacy,
 	.feature_table_size_legacy = ARRAY_SIZE(features_legacy),
 	.driver.name =	KBUILD_MODNAME,
-	.driver.owner =	THIS_MODULE,
 	.id_table =	id_table,
 	.validate =	virtnet_validate,
 	.probe =	virtnet_probe,

-- 
2.34.1


