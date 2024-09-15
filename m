Return-Path: <linux-doc+bounces-25288-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E6979412
	for <lists+linux-doc@lfdr.de>; Sun, 15 Sep 2024 03:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 288341F23040
	for <lists+linux-doc@lfdr.de>; Sun, 15 Sep 2024 01:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9C7748D;
	Sun, 15 Sep 2024 01:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="iZVu366l"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC1CEEAB
	for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2024 01:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726363155; cv=none; b=qnIYUf1R5xVZJLLp+MUDRTvwXPZa80RGg1SqocfGgP7KQoSV2t3J7+svwIQwDjbwbS2uAjF6THpoYdDZUt+TcJuwk5oDvd7sZ4fETeAyEPy50p9LMXsWMED5HlpWPib90XENVcSFDEZPabkDfemICaP8nNL9eR6F1gJ4mR4BGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726363155; c=relaxed/simple;
	bh=s14vBgutowKcr62eIsC9ufvoPLt1SWw3DCy01V2cLUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=jBCTJZckPGQt0XN/GaOallfYXm/1FcREsxoAqcFLF7NGrbnt2155ELRSoAQQ2msntwJkGwgh5tXsP83m80FOOe+m27XeL7R0bbFjvZCHEAPuN6sXfzdppAB8iSL9xnv4XdKneVLX/hbzbw9EhnWwmyzQ4NtBe0YL3xVbpYr0LUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=iZVu366l; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7178df70f28so2562536b3a.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Sep 2024 18:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1726363154; x=1726967954; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwVlUKckgS8bZXoI1lP3EkBH6SRbodiHKOIaI8JuFWk=;
        b=iZVu366lA2bDx1OQUqbhreC6jNy40i3um6ijvZ3b1jbhn92s5uJWiurw0ia+HNLwmd
         83xR+Bm85qkKOP1gbBpTuiZiWB9wzd44OOd/4zMTav8y7C9s/jfo52/1RnkB8pIp35MO
         sasFGP2Ri3GweCxLpM8ddDt41zd2L9drxoLl1hg8nBRkL3xAaJglHW5zdRGhNIQbgrhJ
         F2iUDMFrwLIuBvglWMZD8DR+Nguidy5LLazmunk01e8dKHwl7YdVpsJ1bBuMqH0uZFH4
         5jg0tTUSqj7UTc2lNXeof5FwGhLn46eDZSwnv0dwuBDTAPRri8gHgpNu13BR0GcpJH4D
         1hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726363154; x=1726967954;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwVlUKckgS8bZXoI1lP3EkBH6SRbodiHKOIaI8JuFWk=;
        b=iFiD0WL78f/1/8K9zQ9/TaCGagyZLZL345P2c493I5FGO039HTHZYaJVSnlPrl7sks
         uUxwXYaa+e1oozY9UPXyeXA/7nuFkDrbjRbZwiNqV7UKEXxUMkeNjDFtyEer8e9WRZ/6
         Wu6v3sMKYWuxlGHO/9AS5T2LnN3cZe9ETcItDxq7SrNh8rjjxeHM9Nf1NdMjIPLYAZMn
         JH+EP62OjdBrSKsujRBQi+ASCiErMT6BUOe3bD/Bq02HynGhhv0q145fnMA4iiytc8AR
         wiAkEAdYWsGOw+wG1TPKqCGprIMaGh9034QrSpNeFZ0WShZvbWIl6hmDXX+nshtMZFZI
         otGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEBj2jtH68pKQmRA8EYaNOh4w2bx2mG3gmlpStoB9WmJe6UuF2ugwI+AtHKwTAsFyi7WpHRjHiaF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzmdQbECVUbb8hiaD9u5ZIWLU+KioHT4/Gpay+fxp7CEWkAIoa
	d9kJpdxjURa0q99nqobmJO/k3ty98pGBBiCH4s8QCv2UJO8+53XJFzRmjteoz9IuHXQAp4L0JeL
	ttfg=
X-Google-Smtp-Source: AGHT+IE60/z5cqZPxQare5BSx0GkgFgfZEo8DkLpn1T/gnYQSXT5vBLFlsQk2V5fCDwH8OXIIkoDKQ==
X-Received: by 2002:a05:6a00:919c:b0:710:7fd2:c91 with SMTP id d2e1a72fcca58-71926203062mr13340464b3a.26.1726363153743;
        Sat, 14 Sep 2024 18:19:13 -0700 (PDT)
Received: from localhost ([210.160.217.68])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-71944b7afc5sm1522185b3a.122.2024.09.14.18.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2024 18:19:13 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sun, 15 Sep 2024 10:17:43 +0900
Subject: [PATCH RFC v3 4/9] tap: Pad virtio header with zero
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240915-rss-v3-4-c630015db082@daynix.com>
References: <20240915-rss-v3-0-c630015db082@daynix.com>
In-Reply-To: <20240915-rss-v3-0-c630015db082@daynix.com>
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

tap used to simply advance iov_iter when it needs to pad virtio header.
This leaves the garbage in the buffer as is and prevents telling if the
header is padded or contains some real data.

In theory, a user of tap can fill the buffer with zero before calling
read() to avoid such a problem, but leaving the garbage in the buffer is
awkward anyway so fill the buffer in tap.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 77574f7a3bd4..ba044302ccc6 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -813,7 +813,7 @@ static ssize_t tap_put_user(struct tap_queue *q,
 		    sizeof(vnet_hdr))
 			return -EFAULT;
 
-		iov_iter_advance(iter, vnet_hdr_len - sizeof(vnet_hdr));
+		iov_iter_zero(vnet_hdr_len - sizeof(vnet_hdr), iter);
 	}
 	total = vnet_hdr_len;
 	total += skb->len;

-- 
2.46.0


