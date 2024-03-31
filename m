Return-Path: <linux-doc+bounces-13164-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D74892FD3
	for <lists+linux-doc@lfdr.de>; Sun, 31 Mar 2024 10:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5FEB281A05
	for <lists+linux-doc@lfdr.de>; Sun, 31 Mar 2024 08:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBC212C53A;
	Sun, 31 Mar 2024 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kQUsH6II"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E5912BF22
	for <linux-doc@vger.kernel.org>; Sun, 31 Mar 2024 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711874699; cv=none; b=kTP6ogBUbwTpVsl58Xj20X4GZKhK5JGdKDZG0qj9/P5cfHx1s4u5BhOHlLV+wkp0gNulDCeMnHPtBrGP9qYdq6mkd+cXhoaIYUquXRNoJQh5TVRRO5K8BaiDCIrYJbmg8+yjMOUUrnFDDk1jZQfhRipz1lMhEwj+tYpQp8v7smo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711874699; c=relaxed/simple;
	bh=KrWaLvXjNRGS2R/7/B1+JUwLcklixu9aLwMl5ahCx2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrKcah9YrhqXFwJq1ur1INgwCSmmvdRhFTfIusvaf6p0gN6z/LxWu6IQpMp9Iev5awT8YM+s4emRgzM6UDyMBR0dX9Ltmtd/9YL/LOgpD4ihpSdQVC2WvBWjn5V4CXrwScGVgC3ToeJRyV1q3P/Yl107SGF9D65ckDgZsTj9+yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kQUsH6II; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4155baa696eso4092065e9.2
        for <linux-doc@vger.kernel.org>; Sun, 31 Mar 2024 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874695; x=1712479495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyRMm/wBFZCWNsLJMI0b6MGwMk/UDF0WMd3K76wQcuc=;
        b=kQUsH6IIDJ5cBbQw5ZqsS7Fmlg3O8HFKWwgGrAss8GcXAjZJcWxlUR3lRnPE0KHNeY
         fXQvFRfRBjOfsJ5WNPBGoQjv1JZknclacqwDGDl1kXhz7NOd6F+wZPPkYPBh1K18yHlf
         jjBMuk77cLlWWmqIT/lb+tsoqS98FAbuwSVI6Y/4SOb5nBpEXaqgWuvoVrTpxZMfOMU1
         mdCSJ65meR5esiWqTxYUo7B2lj48CzEUc1Lv6wfPlVyfOrc+XLQF8iHTBwHn8KKXtZ3A
         psn5dQaivif24iDF1fcNEg1qjyi+FfRzS8vszJS1Ez+9h51M7NZ/xjU5hB3laj2BqTHe
         eGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874695; x=1712479495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyRMm/wBFZCWNsLJMI0b6MGwMk/UDF0WMd3K76wQcuc=;
        b=dHDyQwDexOAKIl2BAr9nv9Q91VPP3vgZMXolyJuQi+/ecAF5+auWmFSX0gsUm7X9QI
         ho4pPSEP297GCtUteM5VPBQnJOVMaAP6uNPYDrWyDrDmkzuJSsu/Mh77M0WogtTtjh6+
         oDNGIxlncNBwV+lQMXbHRJfcP62TbVT3hgMN9A749LQfQ8QtvljDo86gIK1NSTNFgvJf
         30wW5DgP9vXxQxxovpsat2aZUKp2tztKPDMbsPtY/ko3bSiBr1P+mMh7oYfvwxXmFbjN
         V12A6Uxp4K26G0dFb4ImpfkL6r324Zmld72EPBI6txNJrah2m0i/WGfyQZ6G15+M4F/T
         DCEw==
X-Forwarded-Encrypted: i=1; AJvYcCX8K7rOcjyWdm5HdACHeXzK15/7nLfG1HiEqF8lJr9Gihiegru4KfSFTc7j6lViHHg9bywOj/yPfZnA2a6anGE7dWvE/bm33aZZ
X-Gm-Message-State: AOJu0YyLskcqZm9Espc4XFXI/7sAWKMDRRcrRnLcCYSIawvqVB/vI8Gm
	aV0CmQaCqjY4mUC5A/C1H2X9WWFtAXvnsm/tL27hqWlFUi0cWjzdJR+frezjyq1nisb4NnuOea6
	K
X-Google-Smtp-Source: AGHT+IGACNL4bJrYwx0UztgLHkocO7cRlSfm5YEfvnab8zjJOAWgroG8Si4+SOgexI9qnY5FfsuBdg==
X-Received: by 2002:a05:600c:21cf:b0:414:767e:6e76 with SMTP id x15-20020a05600c21cf00b00414767e6e76mr4893865wmj.21.1711874695710;
        Sun, 31 Mar 2024 01:44:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:44:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:53 +0200
Subject: [PATCH v2 06/25] virtio_blk: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-6-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=774;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KrWaLvXjNRGS2R/7/B1+JUwLcklixu9aLwMl5ahCx2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJVZjvxVp+IeLHj+IFo/zsUA020KvJ6wRVqy
 okF0tos1aGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiVQAKCRDBN2bmhouD
 11NOD/9bfs5h1GsEf7ulvr0p0JOFXciYxQWCXWYoR6UZ5Y1NWaTZV2G5P+aRmwsBC9m7f3RteEu
 LFFTsbIs4xPoFsUZnvq0EPN1ZoJlw5Lu+lCdhTOWE+/n9qRRnjiZMiZkf6co1scBlDKZZZiJJc/
 8aitfQ7rvN0kKKEfpD46vPy9sil2Qb4SdeCT337bpfJfX5KeMGCMIFRqr5Yqqrq2n0CTb9fzkCV
 ClJTNckXdrd67GbNc8Eovl9ib2M+9Hd3VGxLnGTXBulerZZAe+RlV4xNujaXSHOMLNqi3tk75fI
 cSCKEmU1uzPZNa7imkkSDGf/oitANw7AzhWH55TsJksAuuIgOjcmsVkaBPh5QeLE9nNKFP3aFoz
 2i/DXpiWy4/MDqswsZTJSqh1cGHThiakPD1e6g7P3qXi4taSDEmH1nK1jKKyYu2IAGLD7NY1AGN
 7TA1bOH1Gf/5fQ25e7ABSm2f4BP39YDYMYUKHwX/mttLEcNek8vxjL0VWAGUH9e9yDj+Ava7FeR
 3AWJYYIIDGfAX6P8ZCKw+DcuRhM0u/wfyRBDiKyDjLjKIe8EWDds2o4DbcKo4BHT4/K7a5Odwah
 0Y3ytFsh4TleFSZWzYanuxhyDxjatNAksDPlUlCiBH2EpNQ0CpjJ8WqXdLJbXEpkp8i+W9PhI1t
 z5LzaNGlz2he1Pw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/block/virtio_blk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 42dea7601d87..46bdbad1ab48 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1658,7 +1658,6 @@ static struct virtio_driver virtio_blk = {
 	.feature_table_legacy		= features_legacy,
 	.feature_table_size_legacy	= ARRAY_SIZE(features_legacy),
 	.driver.name			= KBUILD_MODNAME,
-	.driver.owner			= THIS_MODULE,
 	.id_table			= id_table,
 	.probe				= virtblk_probe,
 	.remove				= virtblk_remove,

-- 
2.34.1


