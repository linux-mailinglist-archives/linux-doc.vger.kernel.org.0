Return-Path: <linux-doc+bounces-13178-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1B18930AD
	for <lists+linux-doc@lfdr.de>; Sun, 31 Mar 2024 10:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D8ED1C2106A
	for <lists+linux-doc@lfdr.de>; Sun, 31 Mar 2024 08:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A564145FEC;
	Sun, 31 Mar 2024 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWu988cG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815FF145B25
	for <linux-doc@vger.kernel.org>; Sun, 31 Mar 2024 08:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711874764; cv=none; b=Gg4tDoNQaGrfhZDqYSbv71s2QnRHuML/idA7yCA3Lu2OjyP3Wev0euwqJMpZgtVXElWNEi3YigIs1Fs1O8b/le4o9L+DLhacwVKzxpreqHtkJLgQTI6unODG3M4bJH4Di0nuBuOJpIE4fCoRYs5SPRWr7jcZOCNMoyZGmVia0VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711874764; c=relaxed/simple;
	bh=NiQjVjMZFYqKExZsObNgm/DCszic+bAl+n8BqmPOZX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSFjjXr2+sPQu6r5OIeJ1wTLZrGqe4yxMDinNhp17VdDX6odhJRMVSclEq1pWVAlJMCcm10BO2pILlFCs6PrBddb+VG07q9uVXYNI2ShT1L8CRmPS8bXKSZ+YaGo/hgo0mnhCuwal97nFOwCp/QPuDgGSUa7kgA5Rs9pxGZspK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWu988cG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-341cf28e013so2263375f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 31 Mar 2024 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874760; x=1712479560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAdnlTchQh8FlREm+ioloxT9FS6Bj5xt9o2Hrx59/ek=;
        b=CWu988cGRDQy9s5OBEtOEshkK33WEoVzjNKPu0q2vYiK+P/d5JOpxgnOCHFlSPDT2h
         pe4KS8uXk2fNJI9z6WyPQOf82GPyevAITWAhSI4ncbLIPhUfJy/OWWY87kPM9vgPMrXS
         I5AR+wQPbUz+poejrPSJVxSeKJI1v5nRX1UTOs2tQaZmkbohe3vwFPUp8tpqHVZ7GuqE
         SW7To3oZ+3I79vhZUjxCbY05xbo2oHDdW7rfhe4+No6ZtVCR8LiWLdhUpzExSy8y96fN
         2kQkB+z8oKLvKf1K+aLwdxHKCpP7gu/NeggC/mnAKAJLnNF91UPUKRSZDkQ0h5vSySYv
         2CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874760; x=1712479560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAdnlTchQh8FlREm+ioloxT9FS6Bj5xt9o2Hrx59/ek=;
        b=Cx/U3z1mkQiRQGekJbQm0RZmGbRn5oesj3ASkxK58/lQaAAVHDP6akWuQ70C3z7Ik2
         Y7Gk2IgZkz4DtStJuDBCcdddZnJt7oBPsDoFDvKYATIUUpRL9++/wQWMrMY/HHXMvxc3
         0j316sA/rph84M0NEnR1W1X448RF7TPCDY6Ag+7AEmcfKcRpcREyy4GERJ6J+SsIiMOi
         52xh76COSBxfiY3fcjsYAdVqjsWKeQKrxp2RZGLB0xvUu35H2aDzwg575U1uZ9KuTwhk
         kLFY3LC02g9M7CoFKE0xT/WU9Uw3K5nJlskfcPuCagqNvJurKrCuNRHqL6HFBWCkThvj
         nZoA==
X-Forwarded-Encrypted: i=1; AJvYcCX0DcyaIeJN54UX4Ha4FtGTTXHKSIMkDHlC3X/Igd6SFBEZeG5kn2rA/tQDUKT9jcAEjXhFkyB7lyRn4HJ9Ch6E8Ub2F43mDZsQ
X-Gm-Message-State: AOJu0YyPOzPzRCDBIVTCliLwmkdOlyxqdLRlb/vZXh4OHtei8URk/gvv
	+GShRzxeaRP6/cKmUGhjphubcMio4FCKmHH03qu2qe2boXNks8RVU8xZfR0n7CM=
X-Google-Smtp-Source: AGHT+IGz2LpPwhQY80sjD7cN8u8zFvxhFrt83Qh2uspjyZZar+MqP10mw3FpKFF2x5Oa/ktMacEZzQ==
X-Received: by 2002:adf:efcf:0:b0:342:2ea8:18fa with SMTP id i15-20020adfefcf000000b003422ea818famr4808562wrp.15.1711874759984;
        Sun, 31 Mar 2024 01:45:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:45:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:07 +0200
Subject: [PATCH v2 20/25] wifi: mac80211_hwsim: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-20-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=807;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NiQjVjMZFYqKExZsObNgm/DCszic+bAl+n8BqmPOZX4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJhWw5LbpvzVhFws+zmYGQbgqyzkihUAHIKP
 oZSMQPlSqWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiYQAKCRDBN2bmhouD
 139YEACIQuJ27qQd8eW1dGY27mv+DorF909fjdUQk9218e/PqSQf78sWt8Dwka7RhDehlGI5/jY
 KavPWJS8WmZupYTGwpWwO29uzaCgHZ2UkfSQaCt6QC21Sm2ZSIe5YSORBj73pm4F3aV1pqEG7Zf
 uEKF5SdJn8BL3Sq/8djgih8czEuNasmRrepanUNhtq4BZRUfa9b3d2hIu8czIoxIJ06K8gRv37w
 AsYE4wIp4r8/fbIlRYOdzERJeEbZy971KJWlKSO5MKy6kQgvEcu+ONjd1iR+Fdgfc8CKD9+R7qi
 j0rF0tfjdBKJZQxSDK4OGG7rYqAMfQW1dkb3Wwbs5BfrUc5FsD7sSNfdW4wSQNMO49JRC48Waai
 qcy5cn2TASJYAsl+9siLBtqYDCg8A+zkmblcAz+f8Tg0ZC7adlCFQKf3ab0eBEnC5H1P6JPY3k/
 P+KB2oUo3GGvXUKm0bsUYt4+bB28pkoKTNLzltigIgQGLvc6nx67bmM242YaJrj73rp9q+nHvKI
 69piU8bV2WDZcuDckA55wir1b4ShB3Fxjfw6pOqJxbJCSjvj0a5IvzYr2s2rFI+rEXi3dULTh3W
 8TMJIXX6xAyGSgH1txSm+cdudXTNKT96YWGp98mSXYwNEyRh2EUTl37ZRn/If53EnPmAxYVEX+Z
 M38gpeSfQm/346A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/net/wireless/virtual/mac80211_hwsim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wireless/virtual/mac80211_hwsim.c
index b55fe320633c..ef38b7cc9fdf 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -6662,7 +6662,6 @@ MODULE_DEVICE_TABLE(virtio, id_table);
 
 static struct virtio_driver virtio_hwsim = {
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = hwsim_virtio_probe,
 	.remove = hwsim_virtio_remove,

-- 
2.34.1


