Return-Path: <linux-doc+bounces-33535-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B54A9F9D77
	for <lists+linux-doc@lfdr.de>; Sat, 21 Dec 2024 01:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D0D416B3C7
	for <lists+linux-doc@lfdr.de>; Sat, 21 Dec 2024 00:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73769443;
	Sat, 21 Dec 2024 00:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I7uJk11h"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F230825948C
	for <linux-doc@vger.kernel.org>; Sat, 21 Dec 2024 00:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734742297; cv=none; b=Ei1+gBSaURuT6gMlRdIKom8dwzips+R7bBVDGbCQfWh1oyltSF2CjZAR1uM1yuTy7rsLsVoT9Y7kLIp0tx8dv6XUztGG/3qkB3jNjQZ8btEvyO49/VrBdZEACmnY6cHWsyP7sg9mjQ2AMxmAWBuTbCN/spvXx/K1YCFlAzxmQk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734742297; c=relaxed/simple;
	bh=FRENkPdw5MsSuos6hv3KfxF0ISP2Qe0RZAlvdgY5Q+0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mZQy2Fq1++QZ8DfzPIka4VSWxfjE881r7Ni4o9/f9qtYwWGOB97E4HEHejCBPzifmBAiDecwLtgna0i2iXdjV1zWXXoYESrjsYU1+3NQPuYFIn68fq1OepByR/7ytHNaKZiAvmpPC0Fy8t4dK6dIwPl0YFjUp6+p6Co+oaf4Apg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I7uJk11h; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-725e87a142dso3420684b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 16:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734742294; x=1735347094; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yJnN7ZrxN0wnWRniinuaZCCRmMgcnMSCXct+QU5IKEI=;
        b=I7uJk11hWHysVG2cJjFu7N6jWbQ5FeiKh+AbvSgWnPEX1814KzGy4eFTyB6Y8X8lJD
         gLMjT1G6Qi33skl92zvmuVC3jaguwy1c/jYV6nPfbAYqIjaEYJHNjr8p5j64jv022xV8
         QoSitZAr4dQ86RJMyqjJe1nrn0010KuCF36JrWWsXNvQJFkGydPwZgSS126nyo7MzV5e
         9kv0qO5KMijtB0cbccMjrXU808cjgs+FIgk+mDyJGVcgb+qsljSRQUi2by0edDU+tQKx
         DCVeDVi8wfJbWydcgC6KhTHov2QELx3U24ZADAoj9m1rKeExKkNGdbaTEXSKGygapa7V
         xnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734742294; x=1735347094;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJnN7ZrxN0wnWRniinuaZCCRmMgcnMSCXct+QU5IKEI=;
        b=q6LsUJ2lkmvkURhgKcMS71Mo9G0L80+FMVyuvoDMQn6hiTfmVJIgUqjc8N/wYSXqwQ
         ncCcc1/xOu3vtBM7UYn3N+dh4sK2bRXKXFp++FLH4XqMTJ7CMLIUB+W/N4iwKkFUnUzX
         nkcYQ469MSlxZe1rRLrsLVSfZMEvVouDrYepzfvkxCZsGI1DsfRMYxeYZR44I3sEjXYi
         yOgdDkomqpkpkRywKtMveVvcgEiIjI1+hzHly/XF3Jp3YoNLEoqT+fRqiVAVaktNxZAQ
         91QLnpx4akSbWlDVJ442cyjYASFJunT0ODn8BlHDhThpVDXpYlVzTpIFulfGZZgaGk3O
         KuyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDEjzgetIf+WHU7fQiU5N/PfGwlg7auHQPiJoiLBFrxUGgLrT6ZpwbvdIcpDxeksamUvY0iLVF41o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL17RXDIBCk1Q+h3sUci8gCjEYYUSRVzhCRi1Up/yrWNUAfvHT
	Yno/uax8WmK2pW377AyVKnheKI8Uo7jE9HqJijh9uRGftI6WLVWgAkUkR9b5VkGfg7jFTrTnb7M
	oxkx1KWigEft4WqaCwhtR1Q==
X-Google-Smtp-Source: AGHT+IFPPx0YiYiLnd8xNfIIbmIMwDB+OM3W+mCwV2V7dSBNzPOeeDA2h35zKUR6WA/aeA9SZXl5yVBt8+4OkZfrCg==
X-Received: from pfms15.prod.google.com ([2002:aa7:828f:0:b0:72a:bcc3:4c9a])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1311:b0:728:e81c:2bf4 with SMTP id d2e1a72fcca58-72abddb1958mr6921748b3a.11.1734742294312;
 Fri, 20 Dec 2024 16:51:34 -0800 (PST)
Date: Sat, 21 Dec 2024 00:42:31 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241221004236.2629280-1-almasrymina@google.com>
Subject: [PATCH RFC net-next v1 0/5] Device memory TCP TX
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Joe Damato <jdamato@fastly.com>, dw@davidwei.uk
Content-Type: text/plain; charset="UTF-8"

The TX path had been dropped from the Device Memory TCP patch series
post RFCv1 [1], to make that series slightly easier to review. This
series rebases the implementation of the TX path on top of the
net_iov/netmem framework agreed upon and merged. The motivation for
the feature is thoroughly described in the docs & cover letter of the
original proposal, so I don't repeat the lengthy descriptions here, but
they are available in [1].

Sending this series as RFC as the winder closure is immenient. I plan on
reposting as non-RFC once the tree re-opens, addressing any feedback
I receive in the meantime.

Full outline on usage of the TX path is detailed in the documentation
added in the first patch.

Test example is available via the kselftest included in the series as well.

The series is relatively small, as the TX path for this feature largely
piggybacks on the existing MSG_ZEROCOPY implementation.

Patch Overview:
---------------

1. Documentation & tests to give high level overview of the feature
   being added.

2. Add netmem refcounting needed for the TX path.

3. Devmem TX netlink API.

4. Devmem TX net stack implementation.

Testing:
--------

Testing is very similar to devmem TCP RX path. The ncdevmem test used
for the RX path is now augemented with client functionality to test TX
path.

* Test Setup:

Kernel: net-next with this RFC and memory provider API cherry-picked
locally.

Hardware: Google Cloud A3 VMs.

NIC: GVE with header split & RSS & flow steering support.

Performance results are not included with this version, unfortunately.
I'm having issues running the dma-buf exporter driver against the
upstream kernel on my test setup. The issues are specific to that
dma-buf exporter and do not affect this patch series. I plan to follow
up this series with perf fixes if the tests point to issues once they're
up and running.

Special thanks to Stan who took a stab at rebasing the TX implementation
on top of the netmem/net_iov framework merged. Parts of his proposal [2]
that are reused as-is are forked off into their own patches to give full
credit.

[1] https://lore.kernel.org/netdev/20240909054318.1809580-1-almasrymina@google.com/
[2] https://lore.kernel.org/netdev/20240913150913.1280238-2-sdf@fomichev.me/T/#m066dd407fbed108828e2c40ae50e3f4376ef57fd

Cc: sdf@fomichev.me
Cc: asml.silence@gmail.com
Cc: dw@davidwei.uk


Mina Almasry (4):
  net: add devmem TCP TX documentation
  selftests: ncdevmem: Implement devmem TCP TX
  net: add get_netmem/put_netmem support
  net: devmem: Implement TX path

Stanislav Fomichev (1):
  net: devmem TCP tx netlink api

 Documentation/netlink/specs/netdev.yaml       |  12 +
 Documentation/networking/devmem.rst           | 140 +++++++++-
 include/linux/skbuff.h                        |  13 +-
 include/linux/skbuff_ref.h                    |   4 +-
 include/net/netmem.h                          |   3 +
 include/net/sock.h                            |   2 +
 include/uapi/linux/netdev.h                   |   1 +
 include/uapi/linux/uio.h                      |   5 +
 net/core/datagram.c                           |  40 ++-
 net/core/devmem.c                             | 101 ++++++-
 net/core/devmem.h                             |  51 +++-
 net/core/netdev-genl-gen.c                    |  13 +
 net/core/netdev-genl-gen.h                    |   1 +
 net/core/netdev-genl.c                        |  67 ++++-
 net/core/skbuff.c                             |  38 ++-
 net/core/sock.c                               |   9 +
 net/ipv4/tcp.c                                |  36 ++-
 net/vmw_vsock/virtio_transport_common.c       |   4 +-
 tools/include/uapi/linux/netdev.h             |   1 +
 .../selftests/drivers/net/hw/ncdevmem.c       | 261 +++++++++++++++++-
 20 files changed, 764 insertions(+), 38 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


