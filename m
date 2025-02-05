Return-Path: <linux-doc+bounces-36957-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E273FA28445
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 07:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5A53A5A78
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 06:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2948228381;
	Wed,  5 Feb 2025 06:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="oqSg86sI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8D22837C
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 06:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736555; cv=none; b=PL/OXcvCM2NU2uJ6fub7oKMEoyyX9ktGzJVb1rsUJCiy9EcXAhOqK1f/OWLCIvXuHSAPl75sJK8NWibEtyXaUlRUAlY7rK7HO83wszQ0ejJP4GyM/qRWgiMjOQRSvBQn5VQ6pKm+KoSrzgSP26AD3vN3wGCEb+EJJaHN2sjjkqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736555; c=relaxed/simple;
	bh=8WDHU2a8o+TvYU7S89Oev00JE4W0USl7Pr/i42Ilkw8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kqeI8CrSsk3TgCkLqeKQ8uhKp7IO/IE5PCQLXV7zd1/oLQcKOrokQz3wnEJgT73+WA4+adh4XtqeBCXAj2nHth/Hl4re4dgexZ3ZW1yhroq5EJppw+vL/tq4GXysniop7LcYM4G9Ig/1EfqsBv9GkVnAewiguHWGdJwspi0BLUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=oqSg86sI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2162c0f6a39so9125585ad.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 22:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738736553; x=1739341353; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+wOXEQBExe63vCNTctnNxequJPweHzEdNjWgMgaz30k=;
        b=oqSg86sI56IwwQf8fB3KoHj91QD7itz8Ylo8pI6a/1LWeRg6lrIQPWfOZOpde1Nmza
         iFdGUI+jF96Nn/vCIlhJJ9Irzndw24Omv9yZ29ASz0b6aN7EYoiitmlyrmN4KXn38zUm
         U4RCgc5Neg/taS49IEed7KoD3XWf+q5ETtGaHHtcluPOGyB9uq7prw44pR6NySC+hj46
         q7xrWHlQbAW6yU4HgAtxaAx3GjQRSKsSfiJSIDqzDjstA6NtomvLoIh4yxWhW617aTrd
         BQe9LuXL+ytgrFdF2u7lBowBecziE9BKNcL8eRcYl4deY12Hvyl22WZvINlEPAPVJ+Nf
         jLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738736553; x=1739341353;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wOXEQBExe63vCNTctnNxequJPweHzEdNjWgMgaz30k=;
        b=Zf1KR5tW5LPsrBsJpYs5SW4gBQZjL2RzB+5vN4Y639VqwV9gxIY/Spg1QJNkKWm9C/
         wvn+1rvjHDwecvnWzfbnjT80j0V0j3L0K1vCIRadhossV2xoRIz/HbJisJJxuZdF4oVM
         atI0Q2mRRtCW43F5JWqf+XgNY8keW+e5RWvG27hBezKm8ky03S4KQ0ZvGHnGwvjExaoi
         LXqh6KT/iP7k6eSF6MHhFrdDpSweY9dsy7EAeX10fDwrzxqP8zMceA7cMLA4rRTZgAWR
         ogFtg8cEUryjo56yxKLAEQn/+pmV2YNm78lgIpF6yahGpBZECzDbHMxlWn7CtPLjsR0P
         sBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvMBuka3r+uokMpnm3m79yK7z54ivR0s/QBFtr6j9QaQU4DH3iosePe8BNECvs4ilNIA/XJODmQ7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5OJ4m6mSDmcGA6xcd8ZxShhrVTVWWrmVzYolTJOGs94R2Mmzv
	Ne0w5Uk0aHsjf862uIr1+/U14l4D5fwS4TCmT9cJolzV1/NQwa/KkKAwSujvetle+RqXKO4HPh3
	urTw=
X-Gm-Gg: ASbGncuDPRVu5A+dlhmZ4CK/cczZEm6+Ox9N9U0uHgUPpCdjDHFjO/k+/GyaqxC97yh
	2Qs+PfhEtDy35a5UwOehi5I1dIuOIO+VyvEpXPugnU6JQVV9LXuxao+6TXbb7KYWjSXeHnEG2Kg
	ZPztaaIk+lr5ZDmFYSP+y3ZryhGcuIhXr2dGQXsTR9JWVPnIrZlHGNrPDRShJ4qoQfVhzXiZ37J
	g4fCK8L/sxLKEemoqUY8grid3/tK4Plfmx5wyh3qGT0Y+ayXNp31d7rlY9hYzaJHMx/Qoxx8QZl
	uCBWjBLw2lYrQPd4QPk=
X-Google-Smtp-Source: AGHT+IG21WhSzoCJIvm+AnHNi/NgJ8H7PS8WPvT9Thipit8jAsTx6btg48nfdeJxttEXxjhIUHpDhw==
X-Received: by 2002:a17:902:da8a:b0:21d:90d0:6c10 with SMTP id d9443c01a7336-21f17adb5c1mr29744745ad.23.1738736551500;
        Tue, 04 Feb 2025 22:22:31 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21efe2eb4dfsm28940985ad.124.2025.02.04.22.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 22:22:31 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH net-next v5 0/7] tun: Unify vnet implementation
Date: Wed, 05 Feb 2025 15:22:22 +0900
Message-Id: <20250205-tun-v5-0-15d0b32e87fa@daynix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4Do2cC/2XQza7CIBAF4FcxrMXwV6Cu7nvcuKBlemUhVYqkx
 vTdncCmNy4nM99JzrzJAinAQs6HN0lQwhLmiEN3PJDx6uIf0OBxJoIJxYVkND8j1Ro4c6of2Gg
 IXt4TTGGtKb8kQqYR1kwuuLmGJc/pVeMLr3tM6hhntiYVThnVxhurBqmkUT/evWJYT+N8qwFF7
 FHfkEAkrfXGd05Y476Q3CGuG5KIRj3gPYfeTOYLqR0SrWhRiAAs994x6c30D22teoLHE/+WW//
 Ltn0AgPpSa1UBAAA=
X-Change-ID: 20241230-tun-66e10a49b0c7
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
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.14.2

When I implemented virtio's hash-related features to tun/tap [1],
I found tun/tap does not fill the entire region reserved for the virtio
header, leaving some uninitialized hole in the middle of the buffer
after read()/recvmesg().

This series fills the uninitialized hole. More concretely, the
num_buffers field will be initialized with 1, and the other fields will
be inialized with 0. Setting the num_buffers field to 1 is mandated by
virtio 1.0 [2].

The change to virtio header is preceded by another change that refactors
tun and tap to unify their virtio-related code.

[1]: https://lore.kernel.org/r/20241008-rss-v5-0-f3cf68df005d@daynix.com
[2]: https://lore.kernel.org/r/20241227084256-mutt-send-email-mst@kernel.org/

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v5:
- s/vnet_hdr_len_sz/vnet_hdr_sz/ for patch "tun: Decouple vnet handling"
  (Willem de Bruijn)
- Changed to inline vnet implementations to TUN and TAP.
- Dropped patch "tun: Avoid double-tracking iov_iter length changes" and
  "tap: Avoid double-tracking iov_iter length changes".
- Link to v4: https://lore.kernel.org/r/20250120-tun-v4-0-ee81dda03d7f@daynix.com

Changes in v4:
- s/sz/vnet_hdr_len_sz/ for patch "tun: Decouple vnet handling"
  (Willem de Bruijn)
- Reverted to add CONFIG_TUN_VNET.
- Link to v3: https://lore.kernel.org/r/20250116-tun-v3-0-c6b2871e97f7@daynix.com

Changes in v3:
- Dropped changes to fill the vnet header.
- Splitted patch "tun: Unify vnet implementation".
- Reverted spurious changes in patch "tun: Unify vnet implementation".
- Merged tun_vnet.c into TAP.
- Link to v2: https://lore.kernel.org/r/20250109-tun-v2-0-388d7d5a287a@daynix.com

Changes in v2:
- Fixed num_buffers endian.
- Link to v1: https://lore.kernel.org/r/20250108-tun-v1-0-67d784b34374@daynix.com

---
Akihiko Odaki (7):
      tun: Refactor CONFIG_TUN_VNET_CROSS_LE
      tun: Keep hdr_len in tun_get_user()
      tun: Decouple vnet from tun_struct
      tun: Decouple vnet handling
      tun: Extract the vnet handling code
      tap: Keep hdr_len in tap_get_user()
      tap: Use tun's vnet-related code

 MAINTAINERS            |   2 +-
 drivers/net/tap.c      | 168 ++++++------------------------------------
 drivers/net/tun.c      | 193 ++++++-------------------------------------------
 drivers/net/tun_vnet.h | 184 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 231 insertions(+), 316 deletions(-)
---
base-commit: a32e14f8aef69b42826cf0998b068a43d486a9e9
change-id: 20241230-tun-66e10a49b0c7

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


