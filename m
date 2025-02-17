Return-Path: <linux-doc+bounces-38292-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C1BA37BFE
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 08:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F1B07A258E
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 07:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A725A19E999;
	Mon, 17 Feb 2025 07:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="CHthldAF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f225.google.com (mail-il1-f225.google.com [209.85.166.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4054194C78
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739776740; cv=none; b=OL0tEqTyijiCzmJXM1xthA0b70uCr7IgqNq/jviJnCg1iJ15FESHwir+7j8BtFxvp0WgF0ClWfexdBMB2nOIddncrm5lz4vTehFVn6CxEHJ4m5Ydcbzf0J3VrLHisnzUQKBBbg63xq91SlVQ2yJ50SdxGaluNay+i2FU6ln1ScA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739776740; c=relaxed/simple;
	bh=I4jElsKLO3xjHp4+FGR34gEFeHf8DAoYrFYY9fzZwhI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EUNDgFCevPcOFdMu8Cy4FewnilKRCAsdFTUtZZPhdUlAoO4x9kqKr0SN8hytGoifPCWs6nhxFMpTwq3y07DtExjOsa70nhZCfQTpwUFD4NSbRURQ0YcVSeUk4h6tpgKl6ctfTuOuhL2R/BeTmjtZQ2eiFaleU+7Jr9NC+aLaQ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=CHthldAF; arc=none smtp.client-ip=209.85.166.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-il1-f225.google.com with SMTP id e9e14a558f8ab-3d04932a36cso38062785ab.1
        for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 23:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1739776737; x=1740381537; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gbNYgolpmdlkL880GB4JAqCw8CX2Bv040wvl7gMCZ38=;
        b=CHthldAFUFjxeHujru+Jvv7nzw4s/Jqs35h1XS1Eyx2mD9bVQh/6MhD3uu11WShvba
         2onfH7B053q01+iGNcqtE2nmLhb20UFALmYTW4vPlTdl7k1+VbARKNMOdALR4zbLmvwQ
         XJYk/sv4CdlBsPVcUpKqlees1A/tyRiprQAWi//VwkHWh9EOI9Rt2s+/agK/vzjolrtb
         FYEZZwL9kJgjWumIEeqzh8CcbFLfJgyOqXzEMouFFHPQPEzMpDbRMPGATJnM2HSlmdOF
         WFd1rnrShQalAg0WCiH27UWrsxyTazJpxiRV5yMpcbpgNaDxY/x3ujnr2H06nuBD6joY
         Rp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739776737; x=1740381537;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbNYgolpmdlkL880GB4JAqCw8CX2Bv040wvl7gMCZ38=;
        b=FE37LZkQBDWgG8w+iixtEClkhsQl9wyESOdGArVrPIvYNAoj7mwU5XLauQjOdLHWKA
         rLVCIEFUG9mng2NS3OU0onEqpXoQkxbGl5l12oGGFoayVqPbO5krl53khkhVpJpbK9bn
         FBJzJG5jMyn1ll9lKEDrqSO1SqouTuQVFiruhU44svX/StG2Ok+pVMwXbVlT6CQE/IyS
         fndEmfyo15Et+/qrqvruwo3d6uLLWjpTNnwmpP6RsjkPx90zDuN6MM5AcEMnMFRuDaLN
         ZPSzMvam+IaFoFSMpYYK0YNskhKU/Ras1XgRMDMvXl+d4COE8/PTugODxbZKCJSexLwE
         Z+fA==
X-Forwarded-Encrypted: i=1; AJvYcCU49GVUS6IiTSbXMcjIqy6dRr0YQ7w7HKhVHMYHwe4Nq3Jkio8CJXqgjW0YLfogxsfjbXYUkMQ/d7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMoNzjwAtbpBAbtSZGix86VLYZLSSdUpkluqiJ9I7BpU54P8Y
	0gFJ3FehL2FllsidGxt8WQe87OPbzc+pdg++KBNWoz87DyQvxLm6sH2Oqk9K9OQF7JMdCaVysSv
	yX4no9TdOaLrB1BNrYMB3VTJ075zOlkJO
X-Gm-Gg: ASbGncsLlJx6WEt6FY/C46VAsoGa2GaCiBuzsiZPRqOJAeC1vDANhFuBBzkDAP+vfOc
	mFuhg2Ch5CzTRyUVsx1EzaMMjpSoV0jNdJYvCcw0jxU2ylwnEGTZII5Nne4AAOv93Gx7w46GEzY
	0mkRI1q2fcdKsT44LdVEJCeuhTZLA40b/QDGcVQq/M33QEIPFRWLguK5eFkeX6ziVA3E8k0Xq3w
	U3IpSfbjHiV+KjIws7Ws931SsgwbHL51fuvhqbWygto9GuQJ7pmFwia3gPm4srD2df6V+bp9ULu
	65FugXG/bnK0qo9x/+TXbd7/ThpFKnx70Rb98r0=
X-Google-Smtp-Source: AGHT+IGx14t/coTa0nDHuRYAjHq9TCbFyk7Yy6Dj0apGzi6Dm2S+35KcW2ni8rQ+sOqnrwLIP6VX4564qiy7
X-Received: by 2002:a05:6e02:1a8b:b0:3cf:c8bf:3b87 with SMTP id e9e14a558f8ab-3d28076c338mr59775375ab.1.1739776736932;
        Sun, 16 Feb 2025 23:18:56 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-4ed28171124sm524265173.16.2025.02.16.23.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:18:56 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 861D73402B1;
	Mon, 17 Feb 2025 00:18:55 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 78229E56B89; Mon, 17 Feb 2025 00:18:55 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH net-next v4 0/3] netconsole: allow selection of egress
 interface via MAC address
Date: Mon, 17 Feb 2025 00:18:43 -0700
Message-Id: <20250217-netconsole-v4-0-0c681cef71f1@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTismcC/23NTQ6CMBAF4KuQWVvTHwrqynsYF1in0ERb0mKDI
 dzdsSuNLl/evG8WSBgdJjhUC0TMLrngKdSbCszQ+R6Zu1IGyaXmktfM42SCT+GGrDaN4CjtrhU
 GaDBGtG4u2Anojm7nCc7UDC5NIT7LlyxL/w/MknGm0Wq8aNtw3RzHR8T3tOtxa8K9YFl9AvoLU
 AQIJTslrGjFfv8LrOv6AnJvS+31AAAA
X-Change-ID: 20250204-netconsole-4c610e2f871c
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>, kuniyu@amazon.com, 
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
X-Mailer: b4 0.14.2

This series adds support for selecting a netconsole egress interface by
specifying the MAC address (in place of the interface name) in the
boot/module parameter.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Changes in v4:
- Incorporate Breno Leitao's patch to add (non-RCU) dev_getbyhwaddr and
  use it (Jakub Kicinski)
- Use MAC_ADDR_STR_LEN in ieee80211_sta_debugfs_add as well (Michal
  Swiatkowski)
- Link to v3: https://lore.kernel.org/r/20250205-netconsole-v3-0-132a31f17199@purestorage.com

Changes in v3:
- Rename MAC_ADDR_LEN to MAC_ADDR_STR_LEN (Johannes Berg)
- Link to v2: https://lore.kernel.org/r/20250204-netconsole-v2-0-5ef5eb5f6056@purestorage.com

---
Breno Leitao (1):
      net: Add non-RCU dev_getbyhwaddr() helper

Uday Shankar (2):
      net, treewide: define and use MAC_ADDR_STR_LEN
      netconsole: allow selection of egress interface via MAC address

 Documentation/networking/netconsole.rst |  6 +++-
 drivers/net/netconsole.c                |  2 +-
 drivers/nvmem/brcm_nvram.c              |  2 +-
 drivers/nvmem/layouts/u-boot-env.c      |  2 +-
 include/linux/if_ether.h                |  3 ++
 include/linux/netdevice.h               |  2 ++
 include/linux/netpoll.h                 |  6 ++++
 lib/net_utils.c                         |  4 +--
 net/core/dev.c                          | 37 ++++++++++++++++++++++--
 net/core/netpoll.c                      | 51 +++++++++++++++++++++++++--------
 net/mac80211/debugfs_sta.c              |  7 +++--
 11 files changed, 97 insertions(+), 25 deletions(-)
---
base-commit: 0784d83df3bfc977c13252a0599be924f0afa68d
change-id: 20250204-netconsole-4c610e2f871c

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>


