Return-Path: <linux-doc+bounces-12847-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A8288E5DA
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 15:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C06C929BDB5
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 14:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72811C6892;
	Wed, 27 Mar 2024 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mB+8y+Mb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF4A1C5AC1
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543604; cv=none; b=RJrW93Kk+Y7uIG3qSTvsmdRq9zoVTWqTqqRRsnA3N0mQ80s+YEoTyIYab4dBY8C7k5TQR8/tXkXIuO8HuORb+jepPr4vES1vJYyjuZboKOlmDWwlsmDamiGPswWFoshTzOq0eRW+Rr2FHQjU7sgesUx1iejM8r14UvEPvcrCbgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543604; c=relaxed/simple;
	bh=+b7HD7blN2XR0vp569P7KUgZ+rP9RZRo3/7Ljc6RdPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gd7DEyjVvn7jE5unUkyJxQiObhcNke6PqXIlwNPKQEAOGP0xy6xjS1Uy2MHsMDYMFOvUt+cY1NLARzUyGVOs0CslecPDl2gZsLshohrGFBWBOTNj0vyBzRUgzOglj67s2wJ1i2luW3LKRSKJKlR7bDgLDxedbQP+KXMAyyCcd+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mB+8y+Mb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so8542024a12.0
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 05:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543600; x=1712148400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TImcoBJxfXGIQgqj3n4MKEXII2pXosMotms9pHsJzXs=;
        b=mB+8y+MbQ5b4xCQhL5oKRf/rZChAFoUdzVzedv7+FxYhmcK1WhPa3CceQVP4wH8Tl/
         zRBBH6OzQ7vSoMkaR8/Uj6h/5jXNMlCrTApGXivvLZ1Q2F3PWPVfnLVfWHeKbjn6AlmY
         FyyilVRPS9xVI4gJ3jvyz8UDHCnjE2iIzBup9EEU+2JDYwcPxg0shBAPcU1o4GE6bQmq
         1sh6idy/gO6T6Z37tvE8VjguVXMn04oueZYA7uiuYYJSPceMDdMS4XwEubfnB4xGQjp9
         ZhRgsJIhI97DBOM6tnVIgSCPUziy4LkmNuJq8gAu3yKXvY9+tI1ksHuPbJc7H/bev3/7
         K5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543600; x=1712148400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TImcoBJxfXGIQgqj3n4MKEXII2pXosMotms9pHsJzXs=;
        b=YWFrlyKW6N7sDBK48rbfgDjWG4QtkA8BqYQEy3zhpi6hxwPyWgHk/MTuY1iBMRvOVG
         nBisEgkZfORfFXAj1bpfKlxYlAlbBhDsbCRsholHrTF0dZ3qNZpTuGgUZgtiUxRcaxt4
         KBiK2mYhEv/X+ap4dxBfzTNHU79D8TqeZ8PJ2AZSnGn/+tzvO5bERtegSk97v5Ju4oXM
         gVCu2WY9FXtblANr3/GJrIlpeNQdF7+wZJ6Iekj4HchX55DqHABxk2z1CVS5z4XOmGYT
         kRhVc0i1J+Ke9wztnPYdmBHljIirlRfMLd9GhbrnNcGcWbOznciu4PG7fpKCFrz8UL4z
         /RjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7J9CMebi0XRRAZkCJT/lnvI20qqf2Gxy5Yqmjwyx0DnPtPffbe5hp5DT/KUPHSlZ4sMDPOnyCJOU1YhvvnwzXRCHBWuc1BedT
X-Gm-Message-State: AOJu0YyYbdG8La/5Pfzimwkfk882DdikcD5FpJtta0X03njYhj+JHJUk
	xqxWQ9kEIgR9DMAQIc1C/W82e3SRQNFkgMO/T48k08eczfTi/M1Xnk5KdUobv/E=
X-Google-Smtp-Source: AGHT+IHz3XNCa9vYxVdXv7C592UPDYjRtJdl/QW4qXpaVGK+f9EGoToWDlCo1tr4K4SuiD6SS2oOpw==
X-Received: by 2002:a17:906:5847:b0:a47:1b77:7c4 with SMTP id h7-20020a170906584700b00a471b7707c4mr907960ejs.48.1711543599897;
        Wed, 27 Mar 2024 05:46:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:46:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:12 +0100
Subject: [PATCH 19/22] rpmsg: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-19-0feffab77d99@linaro.org>
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
 bh=+b7HD7blN2XR0vp569P7KUgZ+rP9RZRo3/7Ljc6RdPk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPqAdq/eg/PtMCEKo1gva2x7VgdnMT6C6Tep
 2wGqe9FMdyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT6gAKCRDBN2bmhouD
 1/TJD/4qOl/HewPvOEL3qGcOWPCkSVABYFtSCCfDob4NTUwAYOsNZXbH02ywzlUMcBk5kU1U06e
 AkckuKvzdO/5ojXTRYDkDVHSyZ/6w/2Zete946WspuC9senP7Ez3D3YkNyAxCE+Sk2DVkmiCf2E
 CyINMhaAkygs+ceOFDbHwFTbo7vJVRYCTGaGRm542+GjfTkvYuWVg4xeDHg1ogRagShb3QsonMJ
 iM7hJlEEdxsNQj/ThY3v2hfTnTAx2YlEu+KeqadqilMq04KLM5rus3fTej4xY0P3Ne5G0IffMH1
 EveHiww1oViKjbvjP1s8KwwzV/hlVXkuLkEpSakHpjgTxlrBqrMB2RUdWwPDNaH/T6cC0lQxSHn
 PbZ7RdLNVmu6v4LPR9S1ncpMO//afg+3LNsPd20FwxOaCv3IEiUwKRbUqxkbjuSQH4iwKR6llkU
 IGcF4f5x4/q+EXK6r0Foa98dU3i91q5S1y0X+Fsyceaza2rKKZSTaxY46atCOCfkKWuYH+5+Uju
 5UESG7t+HFinMBkI1h6Qjkyrz93J+YOK5IKd6DQYtK0YownJLLGBpupYua5HeUemtn1gA/b+4ci
 nrfmHTqXJfXn1sKxAPG+3hj2jFzFA2Ibj7vzIzNYNdcpR33XtvVIbUpTu2kE3HPXhlMaJh18Nxt
 9eoqc6/7NrkIp+w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1062939c3264..e9e8c1f7829f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -1053,7 +1053,6 @@ static struct virtio_driver virtio_ipc_driver = {
 	.feature_table	= features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name	= KBUILD_MODNAME,
-	.driver.owner	= THIS_MODULE,
 	.id_table	= id_table,
 	.probe		= rpmsg_probe,
 	.remove		= rpmsg_remove,

-- 
2.34.1


