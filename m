Return-Path: <linux-doc+bounces-31867-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A99E08D4
	for <lists+linux-doc@lfdr.de>; Mon,  2 Dec 2024 17:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53DCF16E288
	for <lists+linux-doc@lfdr.de>; Mon,  2 Dec 2024 16:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182E21DD0F6;
	Mon,  2 Dec 2024 16:29:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9701DBB0C;
	Mon,  2 Dec 2024 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156991; cv=none; b=iNXFbkI4KG2/ccYgINWr5mLgXig1/e/EIjakCX7G6TkgeBG5Razi2I1j0AbWCPi00mCSJITl48/q+KNWzevJUCTV/3qkY8n/bUUUmMiIQ+LHAct1yvlYerAmpJ3zs1fkW6dm9bQxUjtl1D7sdb/ElBYCoIGnnOmKXUQ6z8JqaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156991; c=relaxed/simple;
	bh=msW/4LDzFqV2Bm7Wafk/VZiEqCdMIvfmqBLyskXdx7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BDrcWZZSQI6i3uEoJqljKZ+fvkZUQ0ITw2Bm+ApYwt3n6wxog3csOlDrChE00pWgf8Vo+44NXbZCG8htJwPrds7nLTllc8TKTyrmKJXSTz6uoxtv6hmuCMhZpnatH/1GFKUcKyywSXigVW0OOf+OMesie2500d+mmB4/W4VAKRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fc2b84bc60so2776984a12.1;
        Mon, 02 Dec 2024 08:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733156988; x=1733761788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpTGLIa5UxEMM14aUCJr3TJqOTztx0MpYXiToTpenjk=;
        b=bZVwnkxZT5EzQoHpUk/vcORZx8GPmZc70SZk63JZIKm3Y95pbsmnoSPxMG6oc2pBqp
         rlgLYIaIIPcp/H9pEZc/Pj8R2EDEsqvoheHqPXiRFwGKliAwWipyjnyC7CrbQ/4RmiN0
         GeirrvuBafSES4eXtI0QpIRfqAiiRWGVyYKPne8ZvMA0zdmt3DRxDKTAl0bpXfkITr9W
         Zacy1dslTGCdSFZuhLTfoytei4o88B1d6nFEmWnOQeRRRC9LeF1SMJWyITr062iwbmLy
         1pAc+sr+qjXylilkkmHtsZVFBAU4EvYk+X4O4iDr5xaxnr+kByNWjshFI2try8Y5eqhp
         I7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWIquy7IyGtG6PM1ONbn28F1s6cvZN9TypyXRklU1HlwTkkONkXmSEp2+v94SW5L94O07R51mqRVr8=@vger.kernel.org, AJvYcCXxx4U8qlTZcFpKFwgj1cyorS9ERK0l5ySBjtPXW0sm3kPb8HtNtEyyF7OzvwE0GG2I3JKKCuVHPjQI2bKO@vger.kernel.org
X-Gm-Message-State: AOJu0YwgnDIoLpu60SjPZqowB75mJ6vKdea9hFMKAwn/Xr8lxiEZmHfH
	tWPGzUjhost5b9Y5NRuMECAMaC85pR4XKQr/Ysf0iMt5psw9TsqomCRksoA=
X-Gm-Gg: ASbGnctKX6XGf+WysGXxun6Z1/1POR16fLfq7XhvndHuOpnA6zkN1RygPpPb8ovOJoM
	inJTxndo2rctYpHTQG+4HQaAPfmEzc7p0XIZBGe7S0w5scgcxLIbvrHuZ0JIXlpMDSzKjxZQ3U5
	doifsIOl3rT0U/oFc9SsEGF0+evXV7cbyh9B6epow/O2ZDdz6xp6q3kopli/LDdhUTANa5OwNdt
	L+G0p7WqmfRRxjLnCoLsRYaNjwvhqwETM0OuTtmwlGtXF4oyQ==
X-Google-Smtp-Source: AGHT+IEA6BQkbG3CDeBtWozetODosGAMzvW54YIZEEpSae2FFvPda5IiEMAj4OcmcMLGykOEi5nubA==
X-Received: by 2002:a05:6a21:3989:b0:1dc:3022:fe04 with SMTP id adf61e73a8af0-1e0e0ac31b9mr36272303637.13.1733156987334;
        Mon, 02 Dec 2024 08:29:47 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541849d61sm8681931b3a.193.2024.12.02.08.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 08:29:46 -0800 (PST)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	horms@kernel.org,
	donald.hunter@gmail.com,
	corbet@lwn.net,
	andrew+netdev@lunn.ch,
	kory.maincent@bootlin.com,
	sdf@fomichev.me,
	nicolas.dichtel@6wind.com
Subject: [PATCH net-next v3 7/8] ethtool: remove the comments that are not gonna be generated
Date: Mon,  2 Dec 2024 08:29:35 -0800
Message-ID: <20241202162936.3778016-8-sdf@fomichev.me>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241202162936.3778016-1-sdf@fomichev.me>
References: <20241202162936.3778016-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup the header manually to make it easier to review the changes that ynl
generator brings in. No functional changes.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 .../uapi/linux/ethtool_netlink_generated.h    | 678 +++++++-----------
 1 file changed, 274 insertions(+), 404 deletions(-)

diff --git a/include/uapi/linux/ethtool_netlink_generated.h b/include/uapi/linux/ethtool_netlink_generated.h
index 4b4bf17d1a88..35a24d490efe 100644
--- a/include/uapi/linux/ethtool_netlink_generated.h
+++ b/include/uapi/linux/ethtool_netlink_generated.h
@@ -2,8 +2,6 @@
 #ifndef _UAPI_LINUX_ETHTOOL_NETLINK_GENERATED_H
 #define _UAPI_LINUX_ETHTOOL_NETLINK_GENERATED_H
 
-/* TUNNEL INFO */
-
 enum {
 	ETHTOOL_UDP_TUNNEL_TYPE_VXLAN,
 	ETHTOOL_UDP_TUNNEL_TYPE_GENEVE,
@@ -12,8 +10,6 @@ enum {
 	__ETHTOOL_UDP_TUNNEL_TYPE_CNT
 };
 
-/* request header */
-
 enum ethtool_header_flags {
 	ETHTOOL_FLAG_COMPACT_BITSETS	= 1 << 0,	/* use compact bitsets in reply */
 	ETHTOOL_FLAG_OMIT_REPLY		= 1 << 1,	/* provide optional reply for SET or ACT requests */
@@ -28,303 +24,250 @@ enum {
 
 enum {
 	ETHTOOL_A_HEADER_UNSPEC,
-	ETHTOOL_A_HEADER_DEV_INDEX,		/* u32 */
-	ETHTOOL_A_HEADER_DEV_NAME,		/* string */
-	ETHTOOL_A_HEADER_FLAGS,			/* u32 - ETHTOOL_FLAG_* */
-	ETHTOOL_A_HEADER_PHY_INDEX,		/* u32 */
+	ETHTOOL_A_HEADER_DEV_INDEX,
+	ETHTOOL_A_HEADER_DEV_NAME,
+	ETHTOOL_A_HEADER_FLAGS,
+	ETHTOOL_A_HEADER_PHY_INDEX,
 
-	/* add new constants above here */
 	__ETHTOOL_A_HEADER_CNT,
 	ETHTOOL_A_HEADER_MAX = __ETHTOOL_A_HEADER_CNT - 1
 };
 
-/* bit sets */
-
 enum {
 	ETHTOOL_A_BITSET_BIT_UNSPEC,
-	ETHTOOL_A_BITSET_BIT_INDEX,		/* u32 */
-	ETHTOOL_A_BITSET_BIT_NAME,		/* string */
-	ETHTOOL_A_BITSET_BIT_VALUE,		/* flag */
+	ETHTOOL_A_BITSET_BIT_INDEX,
+	ETHTOOL_A_BITSET_BIT_NAME,
+	ETHTOOL_A_BITSET_BIT_VALUE,
 
-	/* add new constants above here */
 	__ETHTOOL_A_BITSET_BIT_CNT,
 	ETHTOOL_A_BITSET_BIT_MAX = __ETHTOOL_A_BITSET_BIT_CNT - 1
 };
 
 enum {
 	ETHTOOL_A_BITSET_BITS_UNSPEC,
-	ETHTOOL_A_BITSET_BITS_BIT,		/* nest - _A_BITSET_BIT_* */
+	ETHTOOL_A_BITSET_BITS_BIT,
 
-	/* add new constants above here */
 	__ETHTOOL_A_BITSET_BITS_CNT,
 	ETHTOOL_A_BITSET_BITS_MAX = __ETHTOOL_A_BITSET_BITS_CNT - 1
 };
 
 enum {
 	ETHTOOL_A_BITSET_UNSPEC,
-	ETHTOOL_A_BITSET_NOMASK,		/* flag */
-	ETHTOOL_A_BITSET_SIZE,			/* u32 */
-	ETHTOOL_A_BITSET_BITS,			/* nest - _A_BITSET_BITS_* */
-	ETHTOOL_A_BITSET_VALUE,			/* binary */
-	ETHTOOL_A_BITSET_MASK,			/* binary */
+	ETHTOOL_A_BITSET_NOMASK,
+	ETHTOOL_A_BITSET_SIZE,
+	ETHTOOL_A_BITSET_BITS,
+	ETHTOOL_A_BITSET_VALUE,
+	ETHTOOL_A_BITSET_MASK,
 
-	/* add new constants above here */
 	__ETHTOOL_A_BITSET_CNT,
 	ETHTOOL_A_BITSET_MAX = __ETHTOOL_A_BITSET_CNT - 1
 };
 
-/* string sets */
-
 enum {
 	ETHTOOL_A_STRING_UNSPEC,
-	ETHTOOL_A_STRING_INDEX,			/* u32 */
-	ETHTOOL_A_STRING_VALUE,			/* string */
+	ETHTOOL_A_STRING_INDEX,
+	ETHTOOL_A_STRING_VALUE,
 
-	/* add new constants above here */
 	__ETHTOOL_A_STRING_CNT,
 	ETHTOOL_A_STRING_MAX = __ETHTOOL_A_STRING_CNT - 1
 };
 
 enum {
 	ETHTOOL_A_STRINGS_UNSPEC,
-	ETHTOOL_A_STRINGS_STRING,		/* nest - _A_STRINGS_* */
+	ETHTOOL_A_STRINGS_STRING,
 
-	/* add new constants above here */
 	__ETHTOOL_A_STRINGS_CNT,
 	ETHTOOL_A_STRINGS_MAX = __ETHTOOL_A_STRINGS_CNT - 1
 };
 
 enum {
 	ETHTOOL_A_STRINGSET_UNSPEC,
-	ETHTOOL_A_STRINGSET_ID,			/* u32 */
-	ETHTOOL_A_STRINGSET_COUNT,		/* u32 */
-	ETHTOOL_A_STRINGSET_STRINGS,		/* nest - _A_STRINGS_* */
+	ETHTOOL_A_STRINGSET_ID,
+	ETHTOOL_A_STRINGSET_COUNT,
+	ETHTOOL_A_STRINGSET_STRINGS,
 
-	/* add new constants above here */
 	__ETHTOOL_A_STRINGSET_CNT,
 	ETHTOOL_A_STRINGSET_MAX = __ETHTOOL_A_STRINGSET_CNT - 1
 };
 
 enum {
 	ETHTOOL_A_STRINGSETS_UNSPEC,
-	ETHTOOL_A_STRINGSETS_STRINGSET,		/* nest - _A_STRINGSET_* */
+	ETHTOOL_A_STRINGSETS_STRINGSET,
 
-	/* add new constants above here */
 	__ETHTOOL_A_STRINGSETS_CNT,
 	ETHTOOL_A_STRINGSETS_MAX = __ETHTOOL_A_STRINGSETS_CNT - 1
 };
 
-/* STRSET */
-
 enum {
 	ETHTOOL_A_STRSET_UNSPEC,
-	ETHTOOL_A_STRSET_HEADER,		/* nest - _A_HEADER_* */
-	ETHTOOL_A_STRSET_STRINGSETS,		/* nest - _A_STRINGSETS_* */
-	ETHTOOL_A_STRSET_COUNTS_ONLY,		/* flag */
+	ETHTOOL_A_STRSET_HEADER,
+	ETHTOOL_A_STRSET_STRINGSETS,
+	ETHTOOL_A_STRSET_COUNTS_ONLY,
 
-	/* add new constants above here */
 	__ETHTOOL_A_STRSET_CNT,
 	ETHTOOL_A_STRSET_MAX = __ETHTOOL_A_STRSET_CNT - 1
 };
 
-/* PRIVFLAGS */
-
 enum {
 	ETHTOOL_A_PRIVFLAGS_UNSPEC,
-	ETHTOOL_A_PRIVFLAGS_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_PRIVFLAGS_FLAGS,			/* bitset */
+	ETHTOOL_A_PRIVFLAGS_HEADER,
+	ETHTOOL_A_PRIVFLAGS_FLAGS,
 
-	/* add new constants above here */
 	__ETHTOOL_A_PRIVFLAGS_CNT,
 	ETHTOOL_A_PRIVFLAGS_MAX = __ETHTOOL_A_PRIVFLAGS_CNT - 1
 };
 
-/* RINGS */
-
 enum {
 	ETHTOOL_A_RINGS_UNSPEC,
-	ETHTOOL_A_RINGS_HEADER,				/* nest - _A_HEADER_* */
-	ETHTOOL_A_RINGS_RX_MAX,				/* u32 */
-	ETHTOOL_A_RINGS_RX_MINI_MAX,			/* u32 */
-	ETHTOOL_A_RINGS_RX_JUMBO_MAX,			/* u32 */
-	ETHTOOL_A_RINGS_TX_MAX,				/* u32 */
-	ETHTOOL_A_RINGS_RX,				/* u32 */
-	ETHTOOL_A_RINGS_RX_MINI,			/* u32 */
-	ETHTOOL_A_RINGS_RX_JUMBO,			/* u32 */
-	ETHTOOL_A_RINGS_TX,				/* u32 */
-	ETHTOOL_A_RINGS_RX_BUF_LEN,                     /* u32 */
-	ETHTOOL_A_RINGS_TCP_DATA_SPLIT,			/* u8 */
-	ETHTOOL_A_RINGS_CQE_SIZE,			/* u32 */
-	ETHTOOL_A_RINGS_TX_PUSH,			/* u8 */
-	ETHTOOL_A_RINGS_RX_PUSH,			/* u8 */
-	ETHTOOL_A_RINGS_TX_PUSH_BUF_LEN,		/* u32 */
-	ETHTOOL_A_RINGS_TX_PUSH_BUF_LEN_MAX,		/* u32 */
-
-	/* add new constants above here */
+	ETHTOOL_A_RINGS_HEADER,
+	ETHTOOL_A_RINGS_RX_MAX,
+	ETHTOOL_A_RINGS_RX_MINI_MAX,
+	ETHTOOL_A_RINGS_RX_JUMBO_MAX,
+	ETHTOOL_A_RINGS_TX_MAX,
+	ETHTOOL_A_RINGS_RX,
+	ETHTOOL_A_RINGS_RX_MINI,
+	ETHTOOL_A_RINGS_RX_JUMBO,
+	ETHTOOL_A_RINGS_TX,
+	ETHTOOL_A_RINGS_RX_BUF_LEN,
+	ETHTOOL_A_RINGS_TCP_DATA_SPLIT,
+	ETHTOOL_A_RINGS_CQE_SIZE,
+	ETHTOOL_A_RINGS_TX_PUSH,
+	ETHTOOL_A_RINGS_RX_PUSH,
+	ETHTOOL_A_RINGS_TX_PUSH_BUF_LEN,
+	ETHTOOL_A_RINGS_TX_PUSH_BUF_LEN_MAX,
+
 	__ETHTOOL_A_RINGS_CNT,
 	ETHTOOL_A_RINGS_MAX = (__ETHTOOL_A_RINGS_CNT - 1)
 };
 
-/* MAC Merge (802.3) */
-
 enum {
 	ETHTOOL_A_MM_STAT_UNSPEC,
 	ETHTOOL_A_MM_STAT_PAD,
+	ETHTOOL_A_MM_STAT_REASSEMBLY_ERRORS,
+	ETHTOOL_A_MM_STAT_SMD_ERRORS,
+	ETHTOOL_A_MM_STAT_REASSEMBLY_OK,
+	ETHTOOL_A_MM_STAT_RX_FRAG_COUNT,
+	ETHTOOL_A_MM_STAT_TX_FRAG_COUNT,
+	ETHTOOL_A_MM_STAT_HOLD_COUNT,
 
-	/* aMACMergeFrameAssErrorCount */
-	ETHTOOL_A_MM_STAT_REASSEMBLY_ERRORS,	/* u64 */
-	/* aMACMergeFrameSmdErrorCount */
-	ETHTOOL_A_MM_STAT_SMD_ERRORS,		/* u64 */
-	/* aMACMergeFrameAssOkCount */
-	ETHTOOL_A_MM_STAT_REASSEMBLY_OK,	/* u64 */
-	/* aMACMergeFragCountRx */
-	ETHTOOL_A_MM_STAT_RX_FRAG_COUNT,	/* u64 */
-	/* aMACMergeFragCountTx */
-	ETHTOOL_A_MM_STAT_TX_FRAG_COUNT,	/* u64 */
-	/* aMACMergeHoldCount */
-	ETHTOOL_A_MM_STAT_HOLD_COUNT,		/* u64 */
-
-	/* add new constants above here */
 	__ETHTOOL_A_MM_STAT_CNT,
 	ETHTOOL_A_MM_STAT_MAX = (__ETHTOOL_A_MM_STAT_CNT - 1)
 };
 
 enum {
 	ETHTOOL_A_MM_UNSPEC,
-	ETHTOOL_A_MM_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_MM_PMAC_ENABLED,		/* u8 */
-	ETHTOOL_A_MM_TX_ENABLED,		/* u8 */
-	ETHTOOL_A_MM_TX_ACTIVE,			/* u8 */
-	ETHTOOL_A_MM_TX_MIN_FRAG_SIZE,		/* u32 */
-	ETHTOOL_A_MM_RX_MIN_FRAG_SIZE,		/* u32 */
-	ETHTOOL_A_MM_VERIFY_ENABLED,		/* u8 */
-	ETHTOOL_A_MM_VERIFY_STATUS,		/* u8 */
-	ETHTOOL_A_MM_VERIFY_TIME,		/* u32 */
-	ETHTOOL_A_MM_MAX_VERIFY_TIME,		/* u32 */
-	ETHTOOL_A_MM_STATS,			/* nest - _A_MM_STAT_* */
-
-	/* add new constants above here */
+	ETHTOOL_A_MM_HEADER,
+	ETHTOOL_A_MM_PMAC_ENABLED,
+	ETHTOOL_A_MM_TX_ENABLED,
+	ETHTOOL_A_MM_TX_ACTIVE,
+	ETHTOOL_A_MM_TX_MIN_FRAG_SIZE,
+	ETHTOOL_A_MM_RX_MIN_FRAG_SIZE,
+	ETHTOOL_A_MM_VERIFY_ENABLED,
+	ETHTOOL_A_MM_VERIFY_STATUS,
+	ETHTOOL_A_MM_VERIFY_TIME,
+	ETHTOOL_A_MM_MAX_VERIFY_TIME,
+	ETHTOOL_A_MM_STATS,
+
 	__ETHTOOL_A_MM_CNT,
 	ETHTOOL_A_MM_MAX = (__ETHTOOL_A_MM_CNT - 1)
 };
 
-/* LINKINFO */
-
 enum {
 	ETHTOOL_A_LINKINFO_UNSPEC,
-	ETHTOOL_A_LINKINFO_HEADER,		/* nest - _A_HEADER_* */
-	ETHTOOL_A_LINKINFO_PORT,		/* u8 */
-	ETHTOOL_A_LINKINFO_PHYADDR,		/* u8 */
-	ETHTOOL_A_LINKINFO_TP_MDIX,		/* u8 */
-	ETHTOOL_A_LINKINFO_TP_MDIX_CTRL,	/* u8 */
-	ETHTOOL_A_LINKINFO_TRANSCEIVER,		/* u8 */
-
-	/* add new constants above here */
+	ETHTOOL_A_LINKINFO_HEADER,
+	ETHTOOL_A_LINKINFO_PORT,
+	ETHTOOL_A_LINKINFO_PHYADDR,
+	ETHTOOL_A_LINKINFO_TP_MDIX,
+	ETHTOOL_A_LINKINFO_TP_MDIX_CTRL,
+	ETHTOOL_A_LINKINFO_TRANSCEIVER,
+
 	__ETHTOOL_A_LINKINFO_CNT,
 	ETHTOOL_A_LINKINFO_MAX = __ETHTOOL_A_LINKINFO_CNT - 1
 };
 
-/* LINKMODES */
-
 enum {
 	ETHTOOL_A_LINKMODES_UNSPEC,
-	ETHTOOL_A_LINKMODES_HEADER,		/* nest - _A_HEADER_* */
-	ETHTOOL_A_LINKMODES_AUTONEG,		/* u8 */
-	ETHTOOL_A_LINKMODES_OURS,		/* bitset */
-	ETHTOOL_A_LINKMODES_PEER,		/* bitset */
-	ETHTOOL_A_LINKMODES_SPEED,		/* u32 */
-	ETHTOOL_A_LINKMODES_DUPLEX,		/* u8 */
-	ETHTOOL_A_LINKMODES_MASTER_SLAVE_CFG,	/* u8 */
-	ETHTOOL_A_LINKMODES_MASTER_SLAVE_STATE,	/* u8 */
-	ETHTOOL_A_LINKMODES_LANES,		/* u32 */
-	ETHTOOL_A_LINKMODES_RATE_MATCHING,	/* u8 */
-
-	/* add new constants above here */
+	ETHTOOL_A_LINKMODES_HEADER,
+	ETHTOOL_A_LINKMODES_AUTONEG,
+	ETHTOOL_A_LINKMODES_OURS,
+	ETHTOOL_A_LINKMODES_PEER,
+	ETHTOOL_A_LINKMODES_SPEED,
+	ETHTOOL_A_LINKMODES_DUPLEX,
+	ETHTOOL_A_LINKMODES_MASTER_SLAVE_CFG,
+	ETHTOOL_A_LINKMODES_MASTER_SLAVE_STATE,
+	ETHTOOL_A_LINKMODES_LANES,
+	ETHTOOL_A_LINKMODES_RATE_MATCHING,
+
 	__ETHTOOL_A_LINKMODES_CNT,
 	ETHTOOL_A_LINKMODES_MAX = __ETHTOOL_A_LINKMODES_CNT - 1
 };
 
-/* LINKSTATE */
-
 enum {
 	ETHTOOL_A_LINKSTATE_UNSPEC,
-	ETHTOOL_A_LINKSTATE_HEADER,		/* nest - _A_HEADER_* */
-	ETHTOOL_A_LINKSTATE_LINK,		/* u8 */
-	ETHTOOL_A_LINKSTATE_SQI,		/* u32 */
-	ETHTOOL_A_LINKSTATE_SQI_MAX,		/* u32 */
-	ETHTOOL_A_LINKSTATE_EXT_STATE,		/* u8 */
-	ETHTOOL_A_LINKSTATE_EXT_SUBSTATE,	/* u8 */
-	ETHTOOL_A_LINKSTATE_EXT_DOWN_CNT,	/* u32 */
-
-	/* add new constants above here */
+	ETHTOOL_A_LINKSTATE_HEADER,
+	ETHTOOL_A_LINKSTATE_LINK,
+	ETHTOOL_A_LINKSTATE_SQI,
+	ETHTOOL_A_LINKSTATE_SQI_MAX,
+	ETHTOOL_A_LINKSTATE_EXT_STATE,
+	ETHTOOL_A_LINKSTATE_EXT_SUBSTATE,
+	ETHTOOL_A_LINKSTATE_EXT_DOWN_CNT,
+
 	__ETHTOOL_A_LINKSTATE_CNT,
 	ETHTOOL_A_LINKSTATE_MAX = __ETHTOOL_A_LINKSTATE_CNT - 1
 };
 
-/* DEBUG */
-
 enum {
 	ETHTOOL_A_DEBUG_UNSPEC,
-	ETHTOOL_A_DEBUG_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_DEBUG_MSGMASK,		/* bitset */
+	ETHTOOL_A_DEBUG_HEADER,
+	ETHTOOL_A_DEBUG_MSGMASK,
 
-	/* add new constants above here */
 	__ETHTOOL_A_DEBUG_CNT,
 	ETHTOOL_A_DEBUG_MAX = __ETHTOOL_A_DEBUG_CNT - 1
 };
 
-/* WOL */
-
 enum {
 	ETHTOOL_A_WOL_UNSPEC,
-	ETHTOOL_A_WOL_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_WOL_MODES,			/* bitset */
-	ETHTOOL_A_WOL_SOPASS,			/* binary */
+	ETHTOOL_A_WOL_HEADER,
+	ETHTOOL_A_WOL_MODES,
+	ETHTOOL_A_WOL_SOPASS,
 
-	/* add new constants above here */
 	__ETHTOOL_A_WOL_CNT,
 	ETHTOOL_A_WOL_MAX = __ETHTOOL_A_WOL_CNT - 1
 };
 
-/* FEATURES */
-
 enum {
 	ETHTOOL_A_FEATURES_UNSPEC,
-	ETHTOOL_A_FEATURES_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_FEATURES_HW,				/* bitset */
-	ETHTOOL_A_FEATURES_WANTED,			/* bitset */
-	ETHTOOL_A_FEATURES_ACTIVE,			/* bitset */
-	ETHTOOL_A_FEATURES_NOCHANGE,			/* bitset */
+	ETHTOOL_A_FEATURES_HEADER,
+	ETHTOOL_A_FEATURES_HW,
+	ETHTOOL_A_FEATURES_WANTED,
+	ETHTOOL_A_FEATURES_ACTIVE,
+	ETHTOOL_A_FEATURES_NOCHANGE,
 
-	/* add new constants above here */
 	__ETHTOOL_A_FEATURES_CNT,
 	ETHTOOL_A_FEATURES_MAX = __ETHTOOL_A_FEATURES_CNT - 1
 };
 
-/* CHANNELS */
-
 enum {
 	ETHTOOL_A_CHANNELS_UNSPEC,
-	ETHTOOL_A_CHANNELS_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_CHANNELS_RX_MAX,			/* u32 */
-	ETHTOOL_A_CHANNELS_TX_MAX,			/* u32 */
-	ETHTOOL_A_CHANNELS_OTHER_MAX,			/* u32 */
-	ETHTOOL_A_CHANNELS_COMBINED_MAX,		/* u32 */
-	ETHTOOL_A_CHANNELS_RX_COUNT,			/* u32 */
-	ETHTOOL_A_CHANNELS_TX_COUNT,			/* u32 */
-	ETHTOOL_A_CHANNELS_OTHER_COUNT,			/* u32 */
-	ETHTOOL_A_CHANNELS_COMBINED_COUNT,		/* u32 */
-
-	/* add new constants above here */
+	ETHTOOL_A_CHANNELS_HEADER,
+	ETHTOOL_A_CHANNELS_RX_MAX,
+	ETHTOOL_A_CHANNELS_TX_MAX,
+	ETHTOOL_A_CHANNELS_OTHER_MAX,
+	ETHTOOL_A_CHANNELS_COMBINED_MAX,
+	ETHTOOL_A_CHANNELS_RX_COUNT,
+	ETHTOOL_A_CHANNELS_TX_COUNT,
+	ETHTOOL_A_CHANNELS_OTHER_COUNT,
+	ETHTOOL_A_CHANNELS_COMBINED_COUNT,
+
 	__ETHTOOL_A_CHANNELS_CNT,
 	ETHTOOL_A_CHANNELS_MAX = (__ETHTOOL_A_CHANNELS_CNT - 1)
 };
 
 enum {
 	ETHTOOL_A_IRQ_MODERATION_UNSPEC,
-	ETHTOOL_A_IRQ_MODERATION_USEC,			/* u32 */
-	ETHTOOL_A_IRQ_MODERATION_PKTS,			/* u32 */
-	ETHTOOL_A_IRQ_MODERATION_COMPS,			/* u32 */
+	ETHTOOL_A_IRQ_MODERATION_USEC,
+	ETHTOOL_A_IRQ_MODERATION_PKTS,
+	ETHTOOL_A_IRQ_MODERATION_COMPS,
 
 	__ETHTOOL_A_IRQ_MODERATION_CNT,
 	ETHTOOL_A_IRQ_MODERATION_MAX = (__ETHTOOL_A_IRQ_MODERATION_CNT - 1)
@@ -332,111 +275,91 @@ enum {
 
 enum {
 	ETHTOOL_A_PROFILE_UNSPEC,
-	/* nest, _A_IRQ_MODERATION_* */
 	ETHTOOL_A_PROFILE_IRQ_MODERATION,
 	__ETHTOOL_A_PROFILE_CNT,
 	ETHTOOL_A_PROFILE_MAX = (__ETHTOOL_A_PROFILE_CNT - 1)
 };
 
-/* COALESCE */
-
 enum {
 	ETHTOOL_A_COALESCE_UNSPEC,
-	ETHTOOL_A_COALESCE_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_COALESCE_RX_USECS,			/* u32 */
-	ETHTOOL_A_COALESCE_RX_MAX_FRAMES,		/* u32 */
-	ETHTOOL_A_COALESCE_RX_USECS_IRQ,		/* u32 */
-	ETHTOOL_A_COALESCE_RX_MAX_FRAMES_IRQ,		/* u32 */
-	ETHTOOL_A_COALESCE_TX_USECS,			/* u32 */
-	ETHTOOL_A_COALESCE_TX_MAX_FRAMES,		/* u32 */
-	ETHTOOL_A_COALESCE_TX_USECS_IRQ,		/* u32 */
-	ETHTOOL_A_COALESCE_TX_MAX_FRAMES_IRQ,		/* u32 */
-	ETHTOOL_A_COALESCE_STATS_BLOCK_USECS,		/* u32 */
-	ETHTOOL_A_COALESCE_USE_ADAPTIVE_RX,		/* u8 */
-	ETHTOOL_A_COALESCE_USE_ADAPTIVE_TX,		/* u8 */
-	ETHTOOL_A_COALESCE_PKT_RATE_LOW,		/* u32 */
-	ETHTOOL_A_COALESCE_RX_USECS_LOW,		/* u32 */
-	ETHTOOL_A_COALESCE_RX_MAX_FRAMES_LOW,		/* u32 */
-	ETHTOOL_A_COALESCE_TX_USECS_LOW,		/* u32 */
-	ETHTOOL_A_COALESCE_TX_MAX_FRAMES_LOW,		/* u32 */
-	ETHTOOL_A_COALESCE_PKT_RATE_HIGH,		/* u32 */
-	ETHTOOL_A_COALESCE_RX_USECS_HIGH,		/* u32 */
-	ETHTOOL_A_COALESCE_RX_MAX_FRAMES_HIGH,		/* u32 */
-	ETHTOOL_A_COALESCE_TX_USECS_HIGH,		/* u32 */
-	ETHTOOL_A_COALESCE_TX_MAX_FRAMES_HIGH,		/* u32 */
-	ETHTOOL_A_COALESCE_RATE_SAMPLE_INTERVAL,	/* u32 */
-	ETHTOOL_A_COALESCE_USE_CQE_MODE_TX,		/* u8 */
-	ETHTOOL_A_COALESCE_USE_CQE_MODE_RX,		/* u8 */
-	ETHTOOL_A_COALESCE_TX_AGGR_MAX_BYTES,		/* u32 */
-	ETHTOOL_A_COALESCE_TX_AGGR_MAX_FRAMES,		/* u32 */
-	ETHTOOL_A_COALESCE_TX_AGGR_TIME_USECS,		/* u32 */
-	/* nest - _A_PROFILE_IRQ_MODERATION */
+	ETHTOOL_A_COALESCE_HEADER,
+	ETHTOOL_A_COALESCE_RX_USECS,
+	ETHTOOL_A_COALESCE_RX_MAX_FRAMES,
+	ETHTOOL_A_COALESCE_RX_USECS_IRQ,
+	ETHTOOL_A_COALESCE_RX_MAX_FRAMES_IRQ,
+	ETHTOOL_A_COALESCE_TX_USECS,
+	ETHTOOL_A_COALESCE_TX_MAX_FRAMES,
+	ETHTOOL_A_COALESCE_TX_USECS_IRQ,
+	ETHTOOL_A_COALESCE_TX_MAX_FRAMES_IRQ,
+	ETHTOOL_A_COALESCE_STATS_BLOCK_USECS,
+	ETHTOOL_A_COALESCE_USE_ADAPTIVE_RX,
+	ETHTOOL_A_COALESCE_USE_ADAPTIVE_TX,
+	ETHTOOL_A_COALESCE_PKT_RATE_LOW,
+	ETHTOOL_A_COALESCE_RX_USECS_LOW,
+	ETHTOOL_A_COALESCE_RX_MAX_FRAMES_LOW,
+	ETHTOOL_A_COALESCE_TX_USECS_LOW,
+	ETHTOOL_A_COALESCE_TX_MAX_FRAMES_LOW,
+	ETHTOOL_A_COALESCE_PKT_RATE_HIGH,
+	ETHTOOL_A_COALESCE_RX_USECS_HIGH,
+	ETHTOOL_A_COALESCE_RX_MAX_FRAMES_HIGH,
+	ETHTOOL_A_COALESCE_TX_USECS_HIGH,
+	ETHTOOL_A_COALESCE_TX_MAX_FRAMES_HIGH,
+	ETHTOOL_A_COALESCE_RATE_SAMPLE_INTERVAL,
+	ETHTOOL_A_COALESCE_USE_CQE_MODE_TX,
+	ETHTOOL_A_COALESCE_USE_CQE_MODE_RX,
+	ETHTOOL_A_COALESCE_TX_AGGR_MAX_BYTES,
+	ETHTOOL_A_COALESCE_TX_AGGR_MAX_FRAMES,
+	ETHTOOL_A_COALESCE_TX_AGGR_TIME_USECS,
 	ETHTOOL_A_COALESCE_RX_PROFILE,
-	/* nest - _A_PROFILE_IRQ_MODERATION */
 	ETHTOOL_A_COALESCE_TX_PROFILE,
 
-	/* add new constants above here */
 	__ETHTOOL_A_COALESCE_CNT,
 	ETHTOOL_A_COALESCE_MAX = (__ETHTOOL_A_COALESCE_CNT - 1)
 };
 
-/* PAUSE */
-
 enum {
 	ETHTOOL_A_PAUSE_STAT_UNSPEC,
 	ETHTOOL_A_PAUSE_STAT_PAD,
-
 	ETHTOOL_A_PAUSE_STAT_TX_FRAMES,
 	ETHTOOL_A_PAUSE_STAT_RX_FRAMES,
 
-	/* add new constants above here
-	 * adjust ETHTOOL_PAUSE_STAT_CNT if adding non-stats!
-	 */
 	__ETHTOOL_A_PAUSE_STAT_CNT,
 	ETHTOOL_A_PAUSE_STAT_MAX = (__ETHTOOL_A_PAUSE_STAT_CNT - 1)
 };
 
 enum {
 	ETHTOOL_A_PAUSE_UNSPEC,
-	ETHTOOL_A_PAUSE_HEADER,				/* nest - _A_HEADER_* */
-	ETHTOOL_A_PAUSE_AUTONEG,			/* u8 */
-	ETHTOOL_A_PAUSE_RX,				/* u8 */
-	ETHTOOL_A_PAUSE_TX,				/* u8 */
-	ETHTOOL_A_PAUSE_STATS,				/* nest - _PAUSE_STAT_* */
-	ETHTOOL_A_PAUSE_STATS_SRC,			/* u32 */
-
-	/* add new constants above here */
+	ETHTOOL_A_PAUSE_HEADER,
+	ETHTOOL_A_PAUSE_AUTONEG,
+	ETHTOOL_A_PAUSE_RX,
+	ETHTOOL_A_PAUSE_TX,
+	ETHTOOL_A_PAUSE_STATS,
+	ETHTOOL_A_PAUSE_STATS_SRC,
+
 	__ETHTOOL_A_PAUSE_CNT,
 	ETHTOOL_A_PAUSE_MAX = (__ETHTOOL_A_PAUSE_CNT - 1)
 };
 
-/* EEE */
-
 enum {
 	ETHTOOL_A_EEE_UNSPEC,
-	ETHTOOL_A_EEE_HEADER,				/* nest - _A_HEADER_* */
-	ETHTOOL_A_EEE_MODES_OURS,			/* bitset */
-	ETHTOOL_A_EEE_MODES_PEER,			/* bitset */
-	ETHTOOL_A_EEE_ACTIVE,				/* u8 */
-	ETHTOOL_A_EEE_ENABLED,				/* u8 */
-	ETHTOOL_A_EEE_TX_LPI_ENABLED,			/* u8 */
-	ETHTOOL_A_EEE_TX_LPI_TIMER,			/* u32 */
-
-	/* add new constants above here */
+	ETHTOOL_A_EEE_HEADER,
+	ETHTOOL_A_EEE_MODES_OURS,
+	ETHTOOL_A_EEE_MODES_PEER,
+	ETHTOOL_A_EEE_ACTIVE,
+	ETHTOOL_A_EEE_ENABLED,
+	ETHTOOL_A_EEE_TX_LPI_ENABLED,
+	ETHTOOL_A_EEE_TX_LPI_TIMER,
+
 	__ETHTOOL_A_EEE_CNT,
 	ETHTOOL_A_EEE_MAX = (__ETHTOOL_A_EEE_CNT - 1)
 };
 
-/* TSINFO */
-
 enum {
 	ETHTOOL_A_TS_STAT_UNSPEC,
+	ETHTOOL_A_TS_STAT_TX_PKTS,
+	ETHTOOL_A_TS_STAT_TX_LOST,
+	ETHTOOL_A_TS_STAT_TX_ERR,
 
-	ETHTOOL_A_TS_STAT_TX_PKTS,			/* uint */
-	ETHTOOL_A_TS_STAT_TX_LOST,			/* uint */
-	ETHTOOL_A_TS_STAT_TX_ERR,			/* uint */
-
-	/* add new constants above here */
 	__ETHTOOL_A_TS_STAT_CNT,
 	ETHTOOL_A_TS_STAT_MAX = (__ETHTOOL_A_TS_STAT_CNT - 1)
 
@@ -444,23 +367,22 @@ enum {
 
 enum {
 	ETHTOOL_A_TSINFO_UNSPEC,
-	ETHTOOL_A_TSINFO_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_TSINFO_TIMESTAMPING,			/* bitset */
-	ETHTOOL_A_TSINFO_TX_TYPES,			/* bitset */
-	ETHTOOL_A_TSINFO_RX_FILTERS,			/* bitset */
-	ETHTOOL_A_TSINFO_PHC_INDEX,			/* u32 */
-	ETHTOOL_A_TSINFO_STATS,				/* nest - _A_TSINFO_STAT */
-
-	/* add new constants above here */
+	ETHTOOL_A_TSINFO_HEADER,
+	ETHTOOL_A_TSINFO_TIMESTAMPING,
+	ETHTOOL_A_TSINFO_TX_TYPES,
+	ETHTOOL_A_TSINFO_RX_FILTERS,
+	ETHTOOL_A_TSINFO_PHC_INDEX,
+	ETHTOOL_A_TSINFO_STATS,
+
 	__ETHTOOL_A_TSINFO_CNT,
 	ETHTOOL_A_TSINFO_MAX = (__ETHTOOL_A_TSINFO_CNT - 1)
 };
 
 enum {
 	ETHTOOL_A_CABLE_RESULT_UNSPEC,
-	ETHTOOL_A_CABLE_RESULT_PAIR,		/* u8 ETHTOOL_A_CABLE_PAIR_ */
-	ETHTOOL_A_CABLE_RESULT_CODE,		/* u8 ETHTOOL_A_CABLE_RESULT_CODE_ */
-	ETHTOOL_A_CABLE_RESULT_SRC,		/* u32 ETHTOOL_A_CABLE_INF_SRC_ */
+	ETHTOOL_A_CABLE_RESULT_PAIR,
+	ETHTOOL_A_CABLE_RESULT_CODE,
+	ETHTOOL_A_CABLE_RESULT_SRC,
 
 	__ETHTOOL_A_CABLE_RESULT_CNT,
 	ETHTOOL_A_CABLE_RESULT_MAX = (__ETHTOOL_A_CABLE_RESULT_CNT - 1)
@@ -468,9 +390,9 @@ enum {
 
 enum {
 	ETHTOOL_A_CABLE_FAULT_LENGTH_UNSPEC,
-	ETHTOOL_A_CABLE_FAULT_LENGTH_PAIR,	/* u8 ETHTOOL_A_CABLE_PAIR_ */
-	ETHTOOL_A_CABLE_FAULT_LENGTH_CM,	/* u32 */
-	ETHTOOL_A_CABLE_FAULT_LENGTH_SRC,	/* u32 ETHTOOL_A_CABLE_INF_SRC_ */
+	ETHTOOL_A_CABLE_FAULT_LENGTH_PAIR,
+	ETHTOOL_A_CABLE_FAULT_LENGTH_CM,
+	ETHTOOL_A_CABLE_FAULT_LENGTH_SRC,
 
 	__ETHTOOL_A_CABLE_FAULT_LENGTH_CNT,
 	ETHTOOL_A_CABLE_FAULT_LENGTH_MAX = (__ETHTOOL_A_CABLE_FAULT_LENGTH_CNT - 1)
@@ -478,245 +400,204 @@ enum {
 
 enum {
 	ETHTOOL_A_CABLE_NEST_UNSPEC,
-	ETHTOOL_A_CABLE_NEST_RESULT,		/* nest - ETHTOOL_A_CABLE_RESULT_ */
-	ETHTOOL_A_CABLE_NEST_FAULT_LENGTH,	/* nest - ETHTOOL_A_CABLE_FAULT_LENGTH_ */
+	ETHTOOL_A_CABLE_NEST_RESULT,
+	ETHTOOL_A_CABLE_NEST_FAULT_LENGTH,
+
 	__ETHTOOL_A_CABLE_NEST_CNT,
 	ETHTOOL_A_CABLE_NEST_MAX = (__ETHTOOL_A_CABLE_NEST_CNT - 1)
 };
 
-/* CABLE TEST */
-
 enum {
 	ETHTOOL_A_CABLE_TEST_UNSPEC,
-	ETHTOOL_A_CABLE_TEST_HEADER,		/* nest - _A_HEADER_* */
+	ETHTOOL_A_CABLE_TEST_HEADER,
 
-	/* add new constants above here */
 	__ETHTOOL_A_CABLE_TEST_CNT,
 	ETHTOOL_A_CABLE_TEST_MAX = __ETHTOOL_A_CABLE_TEST_CNT - 1
 };
 
 enum {
 	ETHTOOL_A_CABLE_TEST_NTF_UNSPEC,
-	ETHTOOL_A_CABLE_TEST_NTF_HEADER,	/* nest - ETHTOOL_A_HEADER_* */
-	ETHTOOL_A_CABLE_TEST_NTF_STATUS,	/* u8 - _STARTED/_COMPLETE */
-	ETHTOOL_A_CABLE_TEST_NTF_NEST,		/* nest - of results: */
+	ETHTOOL_A_CABLE_TEST_NTF_HEADER,
+	ETHTOOL_A_CABLE_TEST_NTF_STATUS,
+	ETHTOOL_A_CABLE_TEST_NTF_NEST,
 
 	__ETHTOOL_A_CABLE_TEST_NTF_CNT,
 	ETHTOOL_A_CABLE_TEST_NTF_MAX = (__ETHTOOL_A_CABLE_TEST_NTF_CNT - 1)
 };
 
-/* CABLE TEST TDR */
-
 enum {
 	ETHTOOL_A_CABLE_TEST_TDR_CFG_UNSPEC,
-	ETHTOOL_A_CABLE_TEST_TDR_CFG_FIRST,		/* u32 */
-	ETHTOOL_A_CABLE_TEST_TDR_CFG_LAST,		/* u32 */
-	ETHTOOL_A_CABLE_TEST_TDR_CFG_STEP,		/* u32 */
-	ETHTOOL_A_CABLE_TEST_TDR_CFG_PAIR,		/* u8 */
+	ETHTOOL_A_CABLE_TEST_TDR_CFG_FIRST,
+	ETHTOOL_A_CABLE_TEST_TDR_CFG_LAST,
+	ETHTOOL_A_CABLE_TEST_TDR_CFG_STEP,
+	ETHTOOL_A_CABLE_TEST_TDR_CFG_PAIR,
 
-	/* add new constants above here */
 	__ETHTOOL_A_CABLE_TEST_TDR_CFG_CNT,
 	ETHTOOL_A_CABLE_TEST_TDR_CFG_MAX = __ETHTOOL_A_CABLE_TEST_TDR_CFG_CNT - 1
 };
 
 enum {
 	ETHTOOL_A_CABLE_TEST_TDR_NTF_UNSPEC,
-	ETHTOOL_A_CABLE_TEST_TDR_NTF_HEADER,	/* nest - ETHTOOL_A_HEADER_* */
-	ETHTOOL_A_CABLE_TEST_TDR_NTF_STATUS,	/* u8 - _STARTED/_COMPLETE */
-	ETHTOOL_A_CABLE_TEST_TDR_NTF_NEST,	/* nest - of results: */
+	ETHTOOL_A_CABLE_TEST_TDR_NTF_HEADER,
+	ETHTOOL_A_CABLE_TEST_TDR_NTF_STATUS,
+	ETHTOOL_A_CABLE_TEST_TDR_NTF_NEST,
 
-	/* add new constants above here */
 	__ETHTOOL_A_CABLE_TEST_TDR_NTF_CNT,
 	ETHTOOL_A_CABLE_TEST_TDR_NTF_MAX = __ETHTOOL_A_CABLE_TEST_TDR_NTF_CNT - 1
 };
 
 enum {
 	ETHTOOL_A_CABLE_TEST_TDR_UNSPEC,
-	ETHTOOL_A_CABLE_TEST_TDR_HEADER,	/* nest - _A_HEADER_* */
-	ETHTOOL_A_CABLE_TEST_TDR_CFG,		/* nest - *_TDR_CFG_* */
+	ETHTOOL_A_CABLE_TEST_TDR_HEADER,
+	ETHTOOL_A_CABLE_TEST_TDR_CFG,
 
-	/* add new constants above here */
 	__ETHTOOL_A_CABLE_TEST_TDR_CNT,
 	ETHTOOL_A_CABLE_TEST_TDR_MAX = __ETHTOOL_A_CABLE_TEST_TDR_CNT - 1
 };
 
 enum {
 	ETHTOOL_A_TUNNEL_UDP_ENTRY_UNSPEC,
+	ETHTOOL_A_TUNNEL_UDP_ENTRY_PORT,
+	ETHTOOL_A_TUNNEL_UDP_ENTRY_TYPE,
 
-	ETHTOOL_A_TUNNEL_UDP_ENTRY_PORT,		/* be16 */
-	ETHTOOL_A_TUNNEL_UDP_ENTRY_TYPE,		/* u32 */
-
-	/* add new constants above here */
 	__ETHTOOL_A_TUNNEL_UDP_ENTRY_CNT,
 	ETHTOOL_A_TUNNEL_UDP_ENTRY_MAX = (__ETHTOOL_A_TUNNEL_UDP_ENTRY_CNT - 1)
 };
 
 enum {
 	ETHTOOL_A_TUNNEL_UDP_TABLE_UNSPEC,
+	ETHTOOL_A_TUNNEL_UDP_TABLE_SIZE,
+	ETHTOOL_A_TUNNEL_UDP_TABLE_TYPES,
+	ETHTOOL_A_TUNNEL_UDP_TABLE_ENTRY,
 
-	ETHTOOL_A_TUNNEL_UDP_TABLE_SIZE,		/* u32 */
-	ETHTOOL_A_TUNNEL_UDP_TABLE_TYPES,		/* bitset */
-	ETHTOOL_A_TUNNEL_UDP_TABLE_ENTRY,		/* nest - _UDP_ENTRY_* */
-
-	/* add new constants above here */
 	__ETHTOOL_A_TUNNEL_UDP_TABLE_CNT,
 	ETHTOOL_A_TUNNEL_UDP_TABLE_MAX = (__ETHTOOL_A_TUNNEL_UDP_TABLE_CNT - 1)
 };
 
 enum {
 	ETHTOOL_A_TUNNEL_UDP_UNSPEC,
+	ETHTOOL_A_TUNNEL_UDP_TABLE,
 
-	ETHTOOL_A_TUNNEL_UDP_TABLE,			/* nest - _UDP_TABLE_* */
-
-	/* add new constants above here */
 	__ETHTOOL_A_TUNNEL_UDP_CNT,
 	ETHTOOL_A_TUNNEL_UDP_MAX = (__ETHTOOL_A_TUNNEL_UDP_CNT - 1)
 };
 
 enum {
 	ETHTOOL_A_TUNNEL_INFO_UNSPEC,
-	ETHTOOL_A_TUNNEL_INFO_HEADER,			/* nest - _A_HEADER_* */
+	ETHTOOL_A_TUNNEL_INFO_HEADER,
+	ETHTOOL_A_TUNNEL_INFO_UDP_PORTS,
 
-	ETHTOOL_A_TUNNEL_INFO_UDP_PORTS,		/* nest - _UDP_TABLE */
-
-	/* add new constants above here */
 	__ETHTOOL_A_TUNNEL_INFO_CNT,
 	ETHTOOL_A_TUNNEL_INFO_MAX = (__ETHTOOL_A_TUNNEL_INFO_CNT - 1)
 };
 
-/* FEC */
-
 enum {
 	ETHTOOL_A_FEC_STAT_UNSPEC,
 	ETHTOOL_A_FEC_STAT_PAD,
+	ETHTOOL_A_FEC_STAT_CORRECTED,
+	ETHTOOL_A_FEC_STAT_UNCORR,
+	ETHTOOL_A_FEC_STAT_CORR_BITS,
 
-	ETHTOOL_A_FEC_STAT_CORRECTED,			/* array, u64 */
-	ETHTOOL_A_FEC_STAT_UNCORR,			/* array, u64 */
-	ETHTOOL_A_FEC_STAT_CORR_BITS,			/* array, u64 */
-
-	/* add new constants above here */
 	__ETHTOOL_A_FEC_STAT_CNT,
 	ETHTOOL_A_FEC_STAT_MAX = (__ETHTOOL_A_FEC_STAT_CNT - 1)
 };
 
 enum {
 	ETHTOOL_A_FEC_UNSPEC,
-	ETHTOOL_A_FEC_HEADER,				/* nest - _A_HEADER_* */
-	ETHTOOL_A_FEC_MODES,				/* bitset */
-	ETHTOOL_A_FEC_AUTO,				/* u8 */
-	ETHTOOL_A_FEC_ACTIVE,				/* u32 */
-	ETHTOOL_A_FEC_STATS,				/* nest - _A_FEC_STAT */
+	ETHTOOL_A_FEC_HEADER,
+	ETHTOOL_A_FEC_MODES,
+	ETHTOOL_A_FEC_AUTO,
+	ETHTOOL_A_FEC_ACTIVE,
+	ETHTOOL_A_FEC_STATS,
 
 	__ETHTOOL_A_FEC_CNT,
 	ETHTOOL_A_FEC_MAX = (__ETHTOOL_A_FEC_CNT - 1)
 };
 
-/* MODULE EEPROM */
-
 enum {
 	ETHTOOL_A_MODULE_EEPROM_UNSPEC,
-	ETHTOOL_A_MODULE_EEPROM_HEADER,			/* nest - _A_HEADER_* */
-
-	ETHTOOL_A_MODULE_EEPROM_OFFSET,			/* u32 */
-	ETHTOOL_A_MODULE_EEPROM_LENGTH,			/* u32 */
-	ETHTOOL_A_MODULE_EEPROM_PAGE,			/* u8 */
-	ETHTOOL_A_MODULE_EEPROM_BANK,			/* u8 */
-	ETHTOOL_A_MODULE_EEPROM_I2C_ADDRESS,		/* u8 */
-	ETHTOOL_A_MODULE_EEPROM_DATA,			/* binary */
+	ETHTOOL_A_MODULE_EEPROM_HEADER,
+	ETHTOOL_A_MODULE_EEPROM_OFFSET,
+	ETHTOOL_A_MODULE_EEPROM_LENGTH,
+	ETHTOOL_A_MODULE_EEPROM_PAGE,
+	ETHTOOL_A_MODULE_EEPROM_BANK,
+	ETHTOOL_A_MODULE_EEPROM_I2C_ADDRESS,
+	ETHTOOL_A_MODULE_EEPROM_DATA,
 
 	__ETHTOOL_A_MODULE_EEPROM_CNT,
 	ETHTOOL_A_MODULE_EEPROM_MAX = (__ETHTOOL_A_MODULE_EEPROM_CNT - 1)
 };
 
-
 enum {
 	ETHTOOL_A_STATS_GRP_UNSPEC,
 	ETHTOOL_A_STATS_GRP_PAD,
+	ETHTOOL_A_STATS_GRP_ID,
+	ETHTOOL_A_STATS_GRP_SS_ID,
+	ETHTOOL_A_STATS_GRP_STAT,
+	ETHTOOL_A_STATS_GRP_HIST_RX,
+	ETHTOOL_A_STATS_GRP_HIST_TX,
+	ETHTOOL_A_STATS_GRP_HIST_BKT_LOW,
+	ETHTOOL_A_STATS_GRP_HIST_BKT_HI,
+	ETHTOOL_A_STATS_GRP_HIST_VAL,
 
-	ETHTOOL_A_STATS_GRP_ID,			/* u32 */
-	ETHTOOL_A_STATS_GRP_SS_ID,		/* u32 */
-
-	ETHTOOL_A_STATS_GRP_STAT,		/* nest */
-
-	ETHTOOL_A_STATS_GRP_HIST_RX,		/* nest */
-	ETHTOOL_A_STATS_GRP_HIST_TX,		/* nest */
-
-	ETHTOOL_A_STATS_GRP_HIST_BKT_LOW,	/* u32 */
-	ETHTOOL_A_STATS_GRP_HIST_BKT_HI,	/* u32 */
-	ETHTOOL_A_STATS_GRP_HIST_VAL,		/* u64 */
-
-	/* add new constants above here */
 	__ETHTOOL_A_STATS_GRP_CNT,
 	ETHTOOL_A_STATS_GRP_MAX = (__ETHTOOL_A_STATS_GRP_CNT - 1)
 };
 
-/* STATS */
-
 enum {
 	ETHTOOL_A_STATS_UNSPEC,
 	ETHTOOL_A_STATS_PAD,
-	ETHTOOL_A_STATS_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_STATS_GROUPS,			/* bitset */
+	ETHTOOL_A_STATS_HEADER,
+	ETHTOOL_A_STATS_GROUPS,
+	ETHTOOL_A_STATS_GRP,
+	ETHTOOL_A_STATS_SRC,
 
-	ETHTOOL_A_STATS_GRP,			/* nest - _A_STATS_GRP_* */
-
-	ETHTOOL_A_STATS_SRC,			/* u32 */
-
-	/* add new constants above here */
 	__ETHTOOL_A_STATS_CNT,
 	ETHTOOL_A_STATS_MAX = (__ETHTOOL_A_STATS_CNT - 1)
 };
 
-/* PHC VCLOCKS */
-
 enum {
 	ETHTOOL_A_PHC_VCLOCKS_UNSPEC,
-	ETHTOOL_A_PHC_VCLOCKS_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_PHC_VCLOCKS_NUM,			/* u32 */
-	ETHTOOL_A_PHC_VCLOCKS_INDEX,			/* array, s32 */
+	ETHTOOL_A_PHC_VCLOCKS_HEADER,
+	ETHTOOL_A_PHC_VCLOCKS_NUM,
+	ETHTOOL_A_PHC_VCLOCKS_INDEX,
 
-	/* add new constants above here */
 	__ETHTOOL_A_PHC_VCLOCKS_CNT,
 	ETHTOOL_A_PHC_VCLOCKS_MAX = (__ETHTOOL_A_PHC_VCLOCKS_CNT - 1)
 };
 
-/* MODULE */
-
 enum {
 	ETHTOOL_A_MODULE_UNSPEC,
-	ETHTOOL_A_MODULE_HEADER,		/* nest - _A_HEADER_* */
-	ETHTOOL_A_MODULE_POWER_MODE_POLICY,	/* u8 */
-	ETHTOOL_A_MODULE_POWER_MODE,		/* u8 */
+	ETHTOOL_A_MODULE_HEADER,
+	ETHTOOL_A_MODULE_POWER_MODE_POLICY,
+	ETHTOOL_A_MODULE_POWER_MODE,
 
-	/* add new constants above here */
 	__ETHTOOL_A_MODULE_CNT,
 	ETHTOOL_A_MODULE_MAX = (__ETHTOOL_A_MODULE_CNT - 1)
 };
 
-/* Power Sourcing Equipment */
 enum {
 	ETHTOOL_A_C33_PSE_PW_LIMIT_UNSPEC,
-	ETHTOOL_A_C33_PSE_PW_LIMIT_MIN,	/* u32 */
-	ETHTOOL_A_C33_PSE_PW_LIMIT_MAX,	/* u32 */
+	ETHTOOL_A_C33_PSE_PW_LIMIT_MIN,
+	ETHTOOL_A_C33_PSE_PW_LIMIT_MAX,
 };
 
 enum {
 	ETHTOOL_A_PSE_UNSPEC,
-	ETHTOOL_A_PSE_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_PODL_PSE_ADMIN_STATE,		/* u32 */
-	ETHTOOL_A_PODL_PSE_ADMIN_CONTROL,	/* u32 */
-	ETHTOOL_A_PODL_PSE_PW_D_STATUS,		/* u32 */
-	ETHTOOL_A_C33_PSE_ADMIN_STATE,		/* u32 */
-	ETHTOOL_A_C33_PSE_ADMIN_CONTROL,	/* u32 */
-	ETHTOOL_A_C33_PSE_PW_D_STATUS,		/* u32 */
-	ETHTOOL_A_C33_PSE_PW_CLASS,		/* u32 */
-	ETHTOOL_A_C33_PSE_ACTUAL_PW,		/* u32 */
-	ETHTOOL_A_C33_PSE_EXT_STATE,		/* u32 */
-	ETHTOOL_A_C33_PSE_EXT_SUBSTATE,		/* u32 */
-	ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT,	/* u32 */
-	ETHTOOL_A_C33_PSE_PW_LIMIT_RANGES,	/* nest - _C33_PSE_PW_LIMIT_* */
-
-	/* add new constants above here */
+	ETHTOOL_A_PSE_HEADER,
+	ETHTOOL_A_PODL_PSE_ADMIN_STATE,
+	ETHTOOL_A_PODL_PSE_ADMIN_CONTROL,
+	ETHTOOL_A_PODL_PSE_PW_D_STATUS,
+	ETHTOOL_A_C33_PSE_ADMIN_STATE,
+	ETHTOOL_A_C33_PSE_ADMIN_CONTROL,
+	ETHTOOL_A_C33_PSE_PW_D_STATUS,
+	ETHTOOL_A_C33_PSE_PW_CLASS,
+	ETHTOOL_A_C33_PSE_ACTUAL_PW,
+	ETHTOOL_A_C33_PSE_EXT_STATE,
+	ETHTOOL_A_C33_PSE_EXT_SUBSTATE,
+	ETHTOOL_A_C33_PSE_AVAIL_PW_LIMIT,
+	ETHTOOL_A_C33_PSE_PW_LIMIT_RANGES,
+
 	__ETHTOOL_A_PSE_CNT,
 	ETHTOOL_A_PSE_MAX = (__ETHTOOL_A_PSE_CNT - 1)
 };
@@ -724,70 +605,62 @@ enum {
 enum {
 	ETHTOOL_A_RSS_UNSPEC,
 	ETHTOOL_A_RSS_HEADER,
-	ETHTOOL_A_RSS_CONTEXT,		/* u32 */
-	ETHTOOL_A_RSS_HFUNC,		/* u32 */
-	ETHTOOL_A_RSS_INDIR,		/* binary */
-	ETHTOOL_A_RSS_HKEY,		/* binary */
-	ETHTOOL_A_RSS_INPUT_XFRM,	/* u32 */
-	ETHTOOL_A_RSS_START_CONTEXT,	/* u32 */
+	ETHTOOL_A_RSS_CONTEXT,
+	ETHTOOL_A_RSS_HFUNC,
+	ETHTOOL_A_RSS_INDIR,
+	ETHTOOL_A_RSS_HKEY,
+	ETHTOOL_A_RSS_INPUT_XFRM,
+	ETHTOOL_A_RSS_START_CONTEXT,
 
 	__ETHTOOL_A_RSS_CNT,
 	ETHTOOL_A_RSS_MAX = (__ETHTOOL_A_RSS_CNT - 1),
 };
 
-/* PLCA */
-
 enum {
 	ETHTOOL_A_PLCA_UNSPEC,
-	ETHTOOL_A_PLCA_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_PLCA_VERSION,			/* u16 */
-	ETHTOOL_A_PLCA_ENABLED,			/* u8  */
-	ETHTOOL_A_PLCA_STATUS,			/* u8  */
-	ETHTOOL_A_PLCA_NODE_CNT,		/* u32 */
-	ETHTOOL_A_PLCA_NODE_ID,			/* u32 */
-	ETHTOOL_A_PLCA_TO_TMR,			/* u32 */
-	ETHTOOL_A_PLCA_BURST_CNT,		/* u32 */
-	ETHTOOL_A_PLCA_BURST_TMR,		/* u32 */
-
-	/* add new constants above here */
+	ETHTOOL_A_PLCA_HEADER,
+	ETHTOOL_A_PLCA_VERSION,
+	ETHTOOL_A_PLCA_ENABLED,
+	ETHTOOL_A_PLCA_STATUS,
+	ETHTOOL_A_PLCA_NODE_CNT,
+	ETHTOOL_A_PLCA_NODE_ID,
+	ETHTOOL_A_PLCA_TO_TMR,
+	ETHTOOL_A_PLCA_BURST_CNT,
+	ETHTOOL_A_PLCA_BURST_TMR,
+
 	__ETHTOOL_A_PLCA_CNT,
 	ETHTOOL_A_PLCA_MAX = (__ETHTOOL_A_PLCA_CNT - 1)
 };
 
-/* MODULE_FW_FLASH */
-
 enum {
 	ETHTOOL_A_MODULE_FW_FLASH_UNSPEC,
-	ETHTOOL_A_MODULE_FW_FLASH_HEADER,		/* nest - _A_HEADER_* */
-	ETHTOOL_A_MODULE_FW_FLASH_FILE_NAME,		/* string */
-	ETHTOOL_A_MODULE_FW_FLASH_PASSWORD,		/* u32 */
-	ETHTOOL_A_MODULE_FW_FLASH_STATUS,		/* u32 */
-	ETHTOOL_A_MODULE_FW_FLASH_STATUS_MSG,		/* string */
-	ETHTOOL_A_MODULE_FW_FLASH_DONE,			/* uint */
-	ETHTOOL_A_MODULE_FW_FLASH_TOTAL,		/* uint */
-
-	/* add new constants above here */
+	ETHTOOL_A_MODULE_FW_FLASH_HEADER,
+	ETHTOOL_A_MODULE_FW_FLASH_FILE_NAME,
+	ETHTOOL_A_MODULE_FW_FLASH_PASSWORD,
+	ETHTOOL_A_MODULE_FW_FLASH_STATUS,
+	ETHTOOL_A_MODULE_FW_FLASH_STATUS_MSG,
+	ETHTOOL_A_MODULE_FW_FLASH_DONE,
+	ETHTOOL_A_MODULE_FW_FLASH_TOTAL,
+
 	__ETHTOOL_A_MODULE_FW_FLASH_CNT,
 	ETHTOOL_A_MODULE_FW_FLASH_MAX = (__ETHTOOL_A_MODULE_FW_FLASH_CNT - 1)
 };
 
 enum {
 	ETHTOOL_A_PHY_UNSPEC,
-	ETHTOOL_A_PHY_HEADER,			/* nest - _A_HEADER_* */
-	ETHTOOL_A_PHY_INDEX,			/* u32 */
-	ETHTOOL_A_PHY_DRVNAME,			/* string */
-	ETHTOOL_A_PHY_NAME,			/* string */
-	ETHTOOL_A_PHY_UPSTREAM_TYPE,		/* u32 */
-	ETHTOOL_A_PHY_UPSTREAM_INDEX,		/* u32 */
-	ETHTOOL_A_PHY_UPSTREAM_SFP_NAME,	/* string */
-	ETHTOOL_A_PHY_DOWNSTREAM_SFP_NAME,	/* string */
-
-	/* add new constants above here */
+	ETHTOOL_A_PHY_HEADER,
+	ETHTOOL_A_PHY_INDEX,
+	ETHTOOL_A_PHY_DRVNAME,
+	ETHTOOL_A_PHY_NAME,
+	ETHTOOL_A_PHY_UPSTREAM_TYPE,
+	ETHTOOL_A_PHY_UPSTREAM_INDEX,
+	ETHTOOL_A_PHY_UPSTREAM_SFP_NAME,
+	ETHTOOL_A_PHY_DOWNSTREAM_SFP_NAME,
+
 	__ETHTOOL_A_PHY_CNT,
 	ETHTOOL_A_PHY_MAX = (__ETHTOOL_A_PHY_CNT - 1)
 };
 
-/* message types - userspace to kernel */
 enum {
 	ETHTOOL_MSG_USER_NONE,
 	ETHTOOL_MSG_STRSET_GET,
@@ -836,12 +709,10 @@ enum {
 	ETHTOOL_MSG_MODULE_FW_FLASH_ACT,
 	ETHTOOL_MSG_PHY_GET,
 
-	/* add new constants above here */
 	__ETHTOOL_MSG_USER_CNT,
 	ETHTOOL_MSG_USER_MAX = __ETHTOOL_MSG_USER_CNT - 1
 };
 
-/* message types - kernel to userspace */
 enum {
 	ETHTOOL_MSG_KERNEL_NONE,
 	ETHTOOL_MSG_STRSET_GET_REPLY,
@@ -891,7 +762,6 @@ enum {
 	ETHTOOL_MSG_PHY_GET_REPLY,
 	ETHTOOL_MSG_PHY_NTF,
 
-	/* add new constants above here */
 	__ETHTOOL_MSG_KERNEL_CNT,
 	ETHTOOL_MSG_KERNEL_MAX = __ETHTOOL_MSG_KERNEL_CNT - 1
 };
-- 
2.47.0


