Return-Path: <linux-doc+bounces-9744-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A38F5857705
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 08:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 208DC1F25BD3
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 07:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816F517591;
	Fri, 16 Feb 2024 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=okanakyuz.com header.i=@okanakyuz.com header.b="TRTefXCL"
X-Original-To: linux-doc@vger.kernel.org
Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA9A1758E
	for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708070002; cv=pass; b=V1wlEGHKfXAzvdwOyXKNQ+Aqe6Rt7fgjBHMjYa1k84uEn1OICJPF9QEaaBjWLRUTwaslmT5AGolCquJjwK3bQbsV2NSuq3WNMsDn+rfEKL1qZWMsRdCSV6L9KvSDZ5cHrszWHM3DNDpcK2ZnmwKfsewab9f8+8UdF9Qgzj/t/aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708070002; c=relaxed/simple;
	bh=PezQPniDwrxOS1sZ6Z9vu2b1Y/jy/gMt+PRn3CnoUHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X17g/eUycohjeTQcirfsVjRGnABjX2F12/PNVkWWT0x7tJLWwaj411QtVO+TKyUyT0K+KhF24vUIrGqEOFSE3o8iH0gzYcT7RO7Byb0KHgh0QHldrREWRN/FPuAd/tQZPdQ8lDcfcTA884kYVPb8rl9aKBhH/GGyaZql+60E/B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=okanakyuz.com; spf=none smtp.mailfrom=okanakyuz.com; dkim=pass (2048-bit key) header.d=okanakyuz.com header.i=@okanakyuz.com header.b=TRTefXCL; arc=pass smtp.client-ip=23.83.223.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=okanakyuz.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=okanakyuz.com
X-Sender-Id: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A89517A26B6
	for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 07:53:18 +0000 (UTC)
Received: from nl-srv-smtpout1.hostinger.io (unknown [127.0.0.6])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4A5287A2084
	for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 07:53:17 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1708069997; a=rsa-sha256;
	cv=none;
	b=4sVCiECtszvz19bPrHlVsxtJeP4sLNB5EbXFpipgdNyHPzeVUfGw4VrRnwlKv2de2nJIqn
	VhYvcoaRZrQQPaZlOSbVnBtudAHK823Bu6i6T+982P7Rc0nEAfktxuTgZQxWMRU+iLfzSR
	oHYF+Y7xodTj/Ukerm+BXuBbEgQajoBHg97cNmqAAyPALc1tWrT7eARupS2gtHeNG4ZG5N
	6UMmppo7FNmfqKO/8Y2b9vbI+w8lZmOObovvxVC8lahUdhcc/FvF5lYZL15xx2CRV3i+nt
	z21bU+epESG8G1p0AApW3y8g49GScg8iiCACORrZMN6bSIZpAIs5t1wxC3Iv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1708069997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=8cmGCBCZUEA+TV3yv1pZQqP0Eu0Q4AFcXv53Tf+4EVA=;
	b=FMR35+bEHjuXDTmBb5koRU7EJootvOOUTZ2CZA4+GoXCU2cYVN9nmd5j0dJ/yiK+01UkVk
	HVS6FjzokGOFXxFgiOQ1gyI6xMSQW/i5mzKG6bAIDwhJchpVcBBp+mXg7edbfZjY2mWKoQ
	1Pk4ELddkuWsaPuMpNCFQUTGqFOrze+yOWpdCPT3N/2PD65x8lrdXpponUj9zffZMzuIya
	xI/csWeYyNA2TLB4AEo+D34L8Hwv+irahqxAqP4J+WnIJlZoPGpcjUtNWQif00S7fEZMMr
	drrdMa+DP7bm/VmvnmaCqAznuMuzRx6+wRdCto6qhr33mLAh+4cZbhBMYJJskg==
ARC-Authentication-Results: i=1;
	rspamd-55b4bfd7cb-pj7rr;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=okanakyuz@okanakyuz.com
X-Sender-Id: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
X-MailChannels-Auth-Id: hostingeremail
X-Tangy-Wide-Eyed: 73f89abf50e14aac_1708069998354_3359575331
X-MC-Loop-Signature: 1708069998354:874490510
X-MC-Ingress-Time: 1708069998354
Received: from nl-srv-smtpout1.hostinger.io (nl-srv-smtpout1.hostinger.io
 [145.14.150.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.126.181.84 (trex/6.9.2);
	Fri, 16 Feb 2024 07:53:18 +0000
From: Okan Akyuz <okanakyuz@okanakyuz.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=okanakyuz.com;
	s=hostingermail-a; t=1708069995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8cmGCBCZUEA+TV3yv1pZQqP0Eu0Q4AFcXv53Tf+4EVA=;
	b=TRTefXCLsMTfrTsBtc/J/itLJ2XMJM0yAN7TpWEAYP+9h5q4fHEoR0oNFxJUaNbL2PeYHH
	fxzx2+8th6lE6FtTFJfGZTHYwcvZpbC+GfVZWsRtZzphEA/JiByXUKnta4b/vpHi1o7Bcp
	KNJcxb0iVqveglNWjNOGmC0J6J88FxI6jPcADaY4M4KGqAWo4d1i4JhuA4v70gudL+Ih75
	i8XhOw5ChZQu5Kie0RPsapLWf0PTX7EmzSIFXEnFUB9ZfPxpqcE7L7mRMkotw5Its1IVMY
	19jwVNSzDCMw5ome6Y0BKJlS7y6bGTGXiN0nWQE64mt+cgGjhQVw9ndosqOa+Q==
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	okanakyuz@okanakyuz.com
Subject: [PATCH] Update broken Datasheet URL
Date: Fri, 16 Feb 2024 10:52:12 +0300
Message-ID: <20240216075212.69118-1-okanakyuz@okanakyuz.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-Analysis: v=2.4 cv=DIOJ4TNb c=1 sm=1 tr=0 ts=65cf146b a=geHYaF3j5ifCImHjKwHHfg==:117 a=geHYaF3j5ifCImHjKwHHfg==:17 a=-tA9vPf7AAAA:8 a=UXzzSC1OAAAA:8 a=gAnH3GRIAAAA:8 a=GDfwrwm8OuJMyJXZuzcA:9 a=vtdtr2SZiqPAgdHKmkdM:22 a=NXyddzfXndtU_1loVILY:22 a=oVHKYsEdi7-vN-J5QA_j:22
X-CM-Envelope: MS4xfBJ5/lmWxDk8XyjpN88LEIZVKZvTv/g7W8OexkmoDW7V+K8eHde8XNgYKiWZCNI0JgCyugfhGhOOUkUczW5LYsB7fOWVD3aM+0Pwg1qqN05XCEi8NIjK YNcZUVBJ6NX58Fz1761dAM/SAj40PNyzid8tady3ZNxLmuE2grzZGDUxPFIWjl3vN1iZMxNQGWQkgiI2HiCTbhuNZV8PUN1URjLwucqngczsdn4W3zrUShRi nQo0NzIIyEPG9Wu6KCezx83n4dVQSwdEhW+h/weYocfLPqYntaNFceRh+UxxqZo6IqVXMm2HWz5JGZYS8L18UijlT7Lb8YUq0impiRJSLTdbzuBosicmXnx5 f+ecEu/sYaRqgAs8arQX1f4oYBPubsFpakbigwsDmUrWPN8Ak9+BvFtNxz34LUn76YPalOUcTK3HNnxuWq4DlhKR+mbk/A==
X-AuthUser: okanakyuz@okanakyuz.com

The URL for the document in version 19-4039 Rev1 has changed. Updated
the URL reflect the conrect location of the datasheet for the same
version.

Signed-off-by: Okan Akyuz <okanakyuz@okanakyuz.com>
---
 Documentation/hwmon/max6620.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max6620.rst b/Documentation/hwmon/max6620.rst
index 84c1c44d3de4..d70173bf0242 100644
--- a/Documentation/hwmon/max6620.rst
+++ b/Documentation/hwmon/max6620.rst
@@ -11,7 +11,7 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6620.pdf
 
 Authors:
     - L\. Grunenberg <contact@lgrunenberg.de>
-- 
2.43.0


