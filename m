Return-Path: <linux-doc+bounces-25589-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029E984173
	for <lists+linux-doc@lfdr.de>; Tue, 24 Sep 2024 11:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 914C21C2330C
	for <lists+linux-doc@lfdr.de>; Tue, 24 Sep 2024 09:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2B4174EDB;
	Tue, 24 Sep 2024 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="zupO9Ba2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3526176FC5
	for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168488; cv=none; b=Gxtly8LEb2ybR2vC7wiBbxyWcMU5Ax/R0xGwF4wzdnsFzciV3x0caNgarYB5lAnMpUEfx20T+KEY59dl1oNPge85DMarYis8SjPwZ+BfikeiO6FPpGTRG+GYCGEg0M3otL0p+3VzinImTuRdvIN4e1jmsxsToXyX3WUUy2gslM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168488; c=relaxed/simple;
	bh=VYv+sy+VDukn69W3Bu5/T2bthOtDJXnePcCJtj3KG4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=t+zqnuCDazxxpqRZFVbfVp2DaKl95n/algqCIfXUDnqP2OSUaTtxRss8ywBqJASwNHpiuA9g1mZ3OMjm7mAD2syYbF+6cfB5pDbLlm+8RXKFQKTAIxppiuJlzXLYP520svPsis62XjiXNIlCQLo4RKThQsXNxekA+3WXCBRZRFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=zupO9Ba2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso878622666b.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 02:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1727168485; x=1727773285; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1z2jVjMLVH28Vvu6Jrp+eHoNG85dGW4/noaq6q8us20=;
        b=zupO9Ba2eoaQV4vuwKtBUj2VFLr9Q98dCTZWlgvFOWpYJOo42ecmed61dm2HzIX0Wi
         B6+eZSOflcBWi7BcdcBTTy1VuJgKMgq87+KeVSxAIN1zaWssrfIispNgq/HqKSei82kf
         G3Q6vL/R7KYx+3y/EwcnPXLhbonqH1vZsLhhYtzewuEbbUkPUwajUHUCKij7evnY3eej
         Me8/wVdbZ5FoPxG4AEX4rVUGt/l0hlHPop8jKU9Gyho7zLfX6GF76nq6oRgzgh8BhCW6
         9E9lcTPHk49j4QJFVfHqzd0Tzi/O4+/a1dcgdgEOSYKif3TvfuYo8kKkARWiHB/Psjw7
         d15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727168485; x=1727773285;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1z2jVjMLVH28Vvu6Jrp+eHoNG85dGW4/noaq6q8us20=;
        b=tJW7pUBNZfrAGa/vy5HbiEDP3Ap9uoaw9HFa9AyZDh6u+OyFSisIKBypeqN1ffnbRG
         zbrrdeqABqlYIvSE232DQV21WFRGZP3cAXMTYLnwS/AIp3AQwNn+jpVieaAx8nURzFIC
         039j5zPNQ574SlAE2NkfIfB83aUcLNsOmvpTdXgzRCReXfq5qCbQN3iP2w2W4ao6HRtW
         MSSLFPMKwCR9EGmLtuN6NDQy15r/u6a2yikzvbBfLRABDLaggduyLG1LzA0vofm9S62e
         moCbrX9awtPVM2/E5aKYPaNbpWmTeCXE0RUIMOomKTQK4y7t/4a6+ameWtG7Ujg7wX1U
         6Fhg==
X-Forwarded-Encrypted: i=1; AJvYcCVC3rZBcloOiuIcb+viBM2VJbJopFZDLR40No3clhCysdWGhUx5GpyGhLM3FjiQB7lzbUi/MMa0Gew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0sykZLL3esnqAM7C6pJdxGOBvJgTewKxscr4gTDwMBXGT7dqk
	VPpmcNTABCo5uO9b7fWabe5d+IYqy/KOiH878zKVKZwKWU1qy3st0anQgdiU/WE=
X-Google-Smtp-Source: AGHT+IHUq/dkWRpPMqsa4EeYb9S0z67V0A8NcjQ83e5aXy7PtfQ3vrN7fPuwMQhOhYz1y6x1alrMzg==
X-Received: by 2002:a17:907:e212:b0:a90:430e:6a34 with SMTP id a640c23a62f3a-a90d503382dmr1557301366b.31.1727168485178;
        Tue, 24 Sep 2024 02:01:25 -0700 (PDT)
Received: from localhost ([193.32.29.227])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-a9393138be1sm58586966b.219.2024.09.24.02.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 02:01:24 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 24 Sep 2024 11:01:10 +0200
Subject: [PATCH RFC v4 5/9] tun: Pad virtio header with zero
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-rss-v4-5-84e932ec0e6c@daynix.com>
References: <20240924-rss-v4-0-84e932ec0e6c@daynix.com>
In-Reply-To: <20240924-rss-v4-0-84e932ec0e6c@daynix.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

tun used to simply advance iov_iter when it needs to pad virtio header,
which leaves the garbage in the buffer as is. This is especially
problematic when tun starts to allow enabling the hash reporting
feature; even if the feature is enabled, the packet may lack a hash
value and may contain a hole in the virtio header because the packet
arrived before the feature gets enabled or does not contain the
header fields to be hashed. If the hole is not filled with zero, it is
impossible to tell if the packet lacks a hash value.

In theory, a user of tun can fill the buffer with zero before calling
read() to avoid such a problem, but leaving the garbage in the buffer is
awkward anyway so fill the buffer in tun.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tun.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 1d06c560c5e6..9d93ab9ee58f 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -2073,7 +2073,7 @@ static ssize_t tun_put_user_xdp(struct tun_struct *tun,
 		if (unlikely(copy_to_iter(&gso, sizeof(gso), iter) !=
 			     sizeof(gso)))
 			return -EFAULT;
-		iov_iter_advance(iter, vnet_hdr_sz - sizeof(gso));
+		iov_iter_zero(vnet_hdr_sz - sizeof(gso), iter);
 	}
 
 	ret = copy_to_iter(xdp_frame->data, size, iter) + vnet_hdr_sz;
@@ -2146,7 +2146,7 @@ static ssize_t tun_put_user(struct tun_struct *tun,
 		if (copy_to_iter(&gso, sizeof(gso), iter) != sizeof(gso))
 			return -EFAULT;
 
-		iov_iter_advance(iter, vnet_hdr_sz - sizeof(gso));
+		iov_iter_zero(vnet_hdr_sz - sizeof(gso), iter);
 	}
 
 	if (vlan_hlen) {

-- 
2.46.0


