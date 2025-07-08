Return-Path: <linux-doc+bounces-52322-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2866BAFC3A3
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jul 2025 09:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26503BEFBC
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jul 2025 07:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A7625A2B5;
	Tue,  8 Jul 2025 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFPbdQF9"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7902C258CE2
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 07:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751958576; cv=none; b=UDwRoT545xYAVAgH2Yrc2S4Kmhqlg0UwEeUTQbRMNOt9EYN5zGnHJsYgAKd8mtdfTZt24SHBVDYmVsvgBige9EVoYLZ60SWFwseUl3rmPJtMGw95JXDFO8hgzhqZiLaKlB7xcy+W+iUKSmWolls8kk4C2pRTwnLIC19vHuGUou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751958576; c=relaxed/simple;
	bh=c1OqOZi0L6a8x1MgHQq6Hs7UDBb04GSmvQr42NEaa1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kduBBf8Ol6flt9cWlNrzqWnraIVDysp/mpwanAEYf7aGVY7J2JxgrOV0T3lWYyZL6M+xzgsR+0F5sVrhM+k6rXHcTurFF+srGM1nSb23X2QyrBy02lJLUVc+FY/GSoby3rbhxeVxSiLxKht5Um9VUlaJ2uXffZTxBkUyUPCrjpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFPbdQF9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751958572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPdNe7cXMdeKaI4Rm8AI/ehc72jL10HFb6fBGbYEdl8=;
	b=UFPbdQF9LcqVlIyhVC12AXP8S1moUMxYsSZkDS8KE5BEeb6zuKxVKYh2cGJJJI4vLBMk8I
	2I3HZCmG/lN+DFpERxf8/En9K/5bVNbZxxZOcqC8VmkZYb+9PJHBX4MJzEfSSeQZT0DJg5
	Nb2F8RdBVIeyXkyd1A2uU2StWLTL8pw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-235-3WVPtwTTN0qwZRuccRMB7Q-1; Tue,
 08 Jul 2025 03:09:29 -0400
X-MC-Unique: 3WVPtwTTN0qwZRuccRMB7Q-1
X-Mimecast-MFC-AGG-ID: 3WVPtwTTN0qwZRuccRMB7Q_1751958567
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C2F318DA5C0;
	Tue,  8 Jul 2025 07:09:27 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.252])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 03919195608F;
	Tue,  8 Jul 2025 07:09:21 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Jonathan Corbet <corbet@lwn.net>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 net-next 1/9] scripts/kernel_doc.py: properly handle VIRTIO_DECLARE_FEATURES
Date: Tue,  8 Jul 2025 09:08:57 +0200
Message-ID: <ca8beb7f4b0af9f919cada2fd607187455ac55bb.1751874094.git.pabeni@redhat.com>
In-Reply-To: <cover.1751874094.git.pabeni@redhat.com>
References: <cover.1751874094.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The mentioned macro introduce by the next patch will foul kdoc;
fully expand the mentioned macro to avoid the issue.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
 scripts/lib/kdoc/kdoc_parser.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 062453eefc7a..3115558925ac 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -666,6 +666,7 @@ class KernelDoc:
             (KernRe(r'(?:__)?DECLARE_FLEX_ARRAY\s*\(' + args_pattern + r',\s*' + args_pattern + r'\)', re.S), r'\1 \2[]'),
             (KernRe(r'DEFINE_DMA_UNMAP_ADDR\s*\(' + args_pattern + r'\)', re.S), r'dma_addr_t \1'),
             (KernRe(r'DEFINE_DMA_UNMAP_LEN\s*\(' + args_pattern + r'\)', re.S), r'__u32 \1'),
+            (KernRe(r'VIRTIO_DECLARE_FEATURES\s*\(' + args_pattern + r'\)', re.S), r'u64 \1; u64 \1_array[VIRTIO_FEATURES_DWORDS]'),
         ]
 
         # Regexes here are guaranteed to have the end limiter matching
-- 
2.49.0


