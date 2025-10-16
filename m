Return-Path: <linux-doc+bounces-63532-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E2CBE2720
	for <lists+linux-doc@lfdr.de>; Thu, 16 Oct 2025 11:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 53D5A4FB8A8
	for <lists+linux-doc@lfdr.de>; Thu, 16 Oct 2025 09:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B84316903;
	Thu, 16 Oct 2025 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtbPb91F"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A8E3002DC
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760607597; cv=none; b=ieOsdnmk/2i0Ydk/rDKDXd3GxmfXPLdzqF16gBHud/PqpDOYq+JzSI/scKWd15WhGOkkq/QXPbq/gGI/PDHeuMcZPdDF3ADyCPm+ax1LQS/2JRUnIjf0ZQGNG0n778e7Q3g9Y4dWjF6QDS4PZTvpDicXUK5IObuDtm1w93wfmNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760607597; c=relaxed/simple;
	bh=q8o2NQ6L6LFGbktB7GVrgV59ZquhP2NAXmS5kWpAIwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c5QXYvqq6RlS7jzNmqw2a6e896Py3X7JlmxThuwVevb861gm4ISEtGCzxX8Il5+UirgRYeS+wsSLEMObXe5av8ogDHRmIvH+18XLxaXsjiFEXZdmym0o8zwoCgRFjF1nLTm3yLcbzk4DPtR56Y+UuDsgFf7InaOMND+PjLO8A7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtbPb91F; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27c369f8986so5137645ad.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760607595; x=1761212395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++wbAo7zmbNRe4mjezio8SQcxYljBZGJ4IngYV8TGHU=;
        b=UtbPb91FtdAPVaz5Sgg6m36fx1IY4vjfL95TkB6br/YBoD38piNZ10ido5L+1u124S
         7nWL1ApeL9W9rnHC1SCqRIgV14sv2X+hf5yNw2FIjP+dZZfxYGpi/1mZPf4CW/zK5Wsb
         aquMtpLIWurcR1i7WTI8LyQbXXRRNgEb+rp3RVK2Rc27k9cuc3oOEzos2oZihxxJmGJw
         AX1jLjv5yhm3PZgBQOpqmwwLGFuMK7Q+GPhHmNx8iiv5cKfjRJcJzkBMu7IRbTQvH9VZ
         0g/Dsxmt7xZoGXG0LeIF5QYPas9kLb6908h0gQOnHOrNPiM/cSMcCnO7X/fRvdguEQvb
         b2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760607595; x=1761212395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++wbAo7zmbNRe4mjezio8SQcxYljBZGJ4IngYV8TGHU=;
        b=K4NZjqP/floyqxV+SdOs+SoUiGiPsY7aScjc7Y0cHaGNg+Qz+/Gi++eMQYj82FT4VH
         HpHR40ChnL1Tjhy9Zvc9ryLDgTw4Mg3JyJaB5+WyFlxNvb75hhHPlkEJFWtkVGHBTklv
         KRf2BXH7SqG5AxvHAL6OSsIm29AenTmxYy+yuyEVFk/ElcmBLlryuSsURSvRQ7QM21Nh
         yxCSB36yL6M5BR+GouDS44dukdwPo+6FpqLO1phAcUqwlnqJRY1WK6WALLd2uKeI6AkG
         RBsUfyPaQS8JCBNrxpBR+ymGFinEa2tIifIc3DP21v0XWhBKrd2HSDTmO7WUQZpk7kGM
         YN6g==
X-Forwarded-Encrypted: i=1; AJvYcCXGa//Lv112EUjlE3xx9MjXTtYr/55Lw7oIDhOPtTAAPfUN2+Y81spj0xV++6/rQIYoqexywN2m3Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1VHPzfw4EkF3yR5U32SYk60yv3mje0/Mt7fDasqq9As9QfBcF
	Y5sX7XYCCReFD/ekxu3vYO6z3SzipjuCVq2PMa/UglZ2T2Acc3Jh5Zy2
X-Gm-Gg: ASbGncsO5pSZTBLKCbuyZPmkQ2VcKHL0iy8irNLM1br4+0oqOVcffHU47itZq46nJfM
	pRjjTHz+DNCJbQjOVkghkM4qFLBUZWy0VRXIUgT/xeKTv5jKdXr65F4e6YBbENxY8fvtGcbDDZz
	ZRbv/09r/jVc7cWziUBHiay5ZhoKV8jx8wxx7bStBO1zDBKNcTj1w+/KeDUP1WdLQZMu6pRhDVy
	rYSQSahpzDbViKYtxws+5kwGVvAiRRffQtTBS3zwtEQ3nkE6Te0jLFyRvfAgk5jd4+WVrDdzJQh
	Q/h3FcCjnUQpzKsMBlT2t3Ekh/SV0fxNDHRA69N+TTsL3U014gXJzohs63KE0KBuAzrTFya6O8z
	WNiN+GBKLBxRqbco7s0Bl8WRCXIUs5yk+jObPsqcQ+t+cHs7tqOOsLrtisZPO1Kq1UzCvRJPAKz
	b+OfMa7qwXQSFcKQ==
X-Google-Smtp-Source: AGHT+IFS9M80syPYksgqDJ9tQreitknkpLZF7Qn/IO4egCYd5QwU4i8pmScawukphLNSoU9cfWZVbw==
X-Received: by 2002:a17:903:fa6:b0:28e:cb51:1232 with SMTP id d9443c01a7336-2902735656dmr418798465ad.3.1760607594899;
        Thu, 16 Oct 2025 02:39:54 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7b068sm23648445ad.53.2025.10.16.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:39:54 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C21B640C0938; Thu, 16 Oct 2025 16:39:51 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Sridhar Samudrala <sridhar.samudrala@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Krishna Kumar <krikku@gmail.com>,
	Vasudev Kamath <vasudev@copyninja.info>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net v2] Documentation: net: net_failover: Separate cloud-ifupdown-helper and reattach-vf.sh code blocks marker
Date: Thu, 16 Oct 2025 16:39:37 +0700
Message-ID: <20251016093936.29442-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=bagasdotme@gmail.com; h=from:subject; bh=q8o2NQ6L6LFGbktB7GVrgV59ZquhP2NAXmS5kWpAIwo=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkf9uy3WLhuyaq1HtsLPD0S5BTeHpR563FPYGKS+g5J9 afcm4697ShlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEbLUYGXb7L1v9myunTaJd Y245e1rqQV1Th7TFzlZBB74r7t160o/hn84SxeJ2roD+cAvh17H5fTOefklL2nRi+ZZi/uB+574 JLAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

cloud-ifupdown-helper patch and reattach-vf.sh script are rendered in
htmldocs output as normal paragraphs instead of literal code blocks
due to missing separator from respective code block marker. Add it.

Fixes: 738baea4970b ("Documentation: networking: net_failover: Fix documentation")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v1 [1]:

  - Place code block marker at the end of previous paragraph (Simon)

[1]: https://lore.kernel.org/linux-doc/20251015094502.35854-2-bagasdotme@gmail.com/

 Documentation/networking/net_failover.rst | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/networking/net_failover.rst b/Documentation/networking/net_failover.rst
index f4e1b4e07adc8d..2f776e90d3183e 100644
--- a/Documentation/networking/net_failover.rst
+++ b/Documentation/networking/net_failover.rst
@@ -96,9 +96,8 @@ needed to these network configuration daemons to make sure that an IP is
 received only on the 'failover' device.
 
 Below is the patch snippet used with 'cloud-ifupdown-helper' script found on
-Debian cloud images:
+Debian cloud images::
 
-::
   @@ -27,6 +27,8 @@ do_setup() {
        local working="$cfgdir/.$INTERFACE"
        local final="$cfgdir/$INTERFACE"
@@ -172,9 +171,8 @@ appropriate FDB entry is added.
 
 The following script is executed on the destination hypervisor once migration
 completes, and it reattaches the VF to the VM and brings down the virtio-net
-interface.
+interface::
 
-::
   # reattach-vf.sh
   #!/bin/bash
 

base-commit: 8d93ff40d49d70e05c82a74beae31f883fe0eaf8
-- 
An old man doll... just what I always wanted! - Clara


