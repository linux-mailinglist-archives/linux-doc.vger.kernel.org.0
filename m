Return-Path: <linux-doc+bounces-12846-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F2088E5D1
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 15:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D60212A4175
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 14:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E101C5AA3;
	Wed, 27 Mar 2024 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="maTUXGR2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3871B1C522D
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543600; cv=none; b=a/9MoYW0vJxlKj9+zCS5OhE6KtmXLFKlnEopZCKMImyUuKMsro+Pb5nKxWgoNN1hpUBgpUJ2Pxy0CsFDHGkHcSqB93Ek2+q3NXY1RnUTtPnMkmuWvLkrcISzJ6tH0+AP65PVKZOJk7LB45N9KU44atfyjKMGOhS1unmF3ttyigk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543600; c=relaxed/simple;
	bh=W2uPMLn9aZC2/DrVKXkgCHw9/uktQxsAyBYFIcytKDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXGQOU2iN906+IksjEJ2Eck2PXv+RDsj1sieaU65NWmfNTQa+njeEeXsxm4K5t4mq4FGcvj28kPPoTvOpaPTBGYglCFCH8h7jEgyLoRHZLdOsyvk6iXMJfJjmT5MQSVqnhtuZRDq4iqB4DMjfag6/YXV09BORQJbm7ynjUvbg0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=maTUXGR2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513d717269fso8275917e87.0
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543595; x=1712148395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McYmWpIHqnRHuHUKxnmbeBHOdqPaGbBUFgcAd0kJzvU=;
        b=maTUXGR2itrA7IdgrAm63090xvfcEMkBLVRggfMFz5aNoS2YPOTHiNS/rF0Z4tkfja
         DM9VBSAyu61YiV9RubFADkjlj9w7qUBj2YkeB3d72kBv9Wl5u8XVudcHiv146sZmMuvz
         EnFNJwIeMgUYPVU9fexPQH6eAdfedXUpLRq4eVJEG8gxPPFOI4jcH0lhRUp7VYNhsuDy
         EuodkloVYL4UPrx00KQHff5on6bSFOrlBUOtPl5wLJteSFrwpwfDPhUiLgueaYMsbkBf
         930wi3CIU+jBivCV5OS2iOBBbyvievSKot55rqRkV/IQnUfyfp8A0s7IhCk31CloUHpV
         HNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543595; x=1712148395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McYmWpIHqnRHuHUKxnmbeBHOdqPaGbBUFgcAd0kJzvU=;
        b=qPfTDPGmYuL7xqbM4j8HOweLAWr0NfSFSGGWjOjcZ62ui/mNVSIYM+dM+bC7AEPrVF
         NqQ+xnVfz0W2rtQolYoOtF9OAbaJC51Vpp57j77/vOjKpjX6RY8OFHK7Wby2dDZsNTcj
         NwCX+6U8HFIghk6lI75nZE87mGSU0oG0J+NaiuVBeOvd6mcp6I2T3mHPmUE4GPuH2hmB
         hdQkN431JZgoR2Z1x8+Rx0W6LQ83pP10pt/TtHACH78gBDi9qjm/g+33jDSDnZgGv131
         bc15vd1xRsEgX+oidgb4oli9u4MF8KK0lYFfS8xWQxjZyZlMstkQCNnI/BC9VZTZsgn2
         qM+g==
X-Forwarded-Encrypted: i=1; AJvYcCUNdZuovyMi2wuI1oSpX2b3O4ClqxGfw7BdpyVFVhsPZV0I0dftY6hj7q+Igrhmn0Rz3SnIlloZ7JgJ9tN0631a/o1XiEUjl/+O
X-Gm-Message-State: AOJu0YxLjZD3tm3+Y7S5q+ZUQZhX1+mf+1DwNj5Mds1H04mKOryAxkPD
	hzRMyLkyGRn9P1XZIDDVGGrodmnmRAUjbA2c+oCb+9ZtQmmOJqq4jCxEY9zEh+Y=
X-Google-Smtp-Source: AGHT+IHh6rqFh581bZcQYBRywOYCRmWZwQeyq1mV0qRFBN/2g2Xt2bwkSDnVtTf/8goPKjdNKzBlNg==
X-Received: by 2002:a05:6512:613:b0:513:c658:799b with SMTP id b19-20020a056512061300b00513c658799bmr1766554lfe.55.1711543595380;
        Wed, 27 Mar 2024 05:46:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:46:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:11 +0100
Subject: [PATCH 18/22] nvdimm: virtio_pmem: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-18-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=768;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=W2uPMLn9aZC2/DrVKXkgCHw9/uktQxsAyBYFIcytKDI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPpSVn6rxVJDZQj8B+8I+NhZbQA6sHLNZh6o
 gaig58YQCiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT6QAKCRDBN2bmhouD
 16IXD/wMe3wrEOFRyQ1As6FVIhIxHfNiU4EbPISAAb/XWzfqomyrReiTCWLclRbdalbAuQ1rW0D
 klwPUTS03qKbji2eSzPJTBEDw9REoZ5/oLueiWNfexxci7Fh+A/jvUZqh+uLCes4gL//yxJPVCX
 nhR9oQCt3KEvZgc0/lm73Bdw5ZEEbI+IOYwunjBEg+q9YBYl+zCQpsmn/f4h6rj/6SMs01l7Tv2
 V7Uzy4K6wWxtZpgqiH5QJXZGjIut9coUOv02Q38vYoPph9aS0ukNOnCTL0D1Lof5BNNajHY005t
 nkgndhV4iGXC+Drokj00ocBVJzO8JAWltMee62xUt4QmaVCMpoqf3wnzLMuDLOUgkgvSkfE6pzm
 pXAN4kL9A4HmrZHUI5a6QM1uTC+MZ4SleUgLn/6wOrBDOR49383tLtfEVSzgbIqmRO8bPyQmYZr
 FgwgxlDCMx1v41Awx8l79hBj4GKfUlq1vb2TIlm+8oFD+A+nG0S67SjIaDiwmCuS1y0Kd5cxxus
 Osa7Ne3T/pwXFTo+kyaO00o7ZMMbmm4bEE8txq29HnJpyERvE1tPmQVmozj6AM6a66RSPTYla+G
 xHoslSrNVR+YphBl/AY+jLFV9dwGxFZoLSQm/TXlcAHxHFvNNBGrCZgKV6V3+GSW6ZqanjqpZkc
 jqdvJ7rL2ENHOaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/nvdimm/virtio_pmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
index 4ceced5cefcf..c9b97aeabf85 100644
--- a/drivers/nvdimm/virtio_pmem.c
+++ b/drivers/nvdimm/virtio_pmem.c
@@ -151,7 +151,6 @@ static struct virtio_driver virtio_pmem_driver = {
 	.feature_table		= features,
 	.feature_table_size	= ARRAY_SIZE(features),
 	.driver.name		= KBUILD_MODNAME,
-	.driver.owner		= THIS_MODULE,
 	.id_table		= id_table,
 	.validate		= virtio_pmem_validate,
 	.probe			= virtio_pmem_probe,

-- 
2.34.1


