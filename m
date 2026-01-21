Return-Path: <linux-doc+bounces-73503-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCsgMsALcWmPcQAAu9opvQ
	(envelope-from <linux-doc+bounces-73503-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 18:24:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB1F5A78D
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 18:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5366068960B
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 16:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FDE3A8FFC;
	Wed, 21 Jan 2026 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIi5QCw/"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD527330660
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012589; cv=none; b=sFdDH2jZHAutwAs9WiGMCuh2og2ALj1GODqrq9RXe7DejuCEOdG3kwzHWPW3K4iVk7wD7qz1SDqQebew/bY2bm79b1mJuYj51L1YsxbcMXOHlHZ/FMX2nKrDosHYxcGX0SMymD3MGrOMEPO8okocyCWUQhXdEi09PDFRZPVqIaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012589; c=relaxed/simple;
	bh=ks57jkdW/KrJZ1O+qpYuIMBO4yJej3zDvmP56bgTAEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6CAht4LZjaxa0HLcqahMftGI83BDiyJ1MjiR90tEm4KCmBddtWEJagJWEWOZ9zzMHBjNmT/TitPDQSibEUgvN6AgTrLUw+XMbP3+TrwPXEq7n0YVYTcp/MBJHhoAHP4EyjDNi/XT5Fd36IePtFsf1GI25r7varvEhuwZGNjB8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIi5QCw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91BAC116D0;
	Wed, 21 Jan 2026 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012589;
	bh=ks57jkdW/KrJZ1O+qpYuIMBO4yJej3zDvmP56bgTAEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pIi5QCw/PTZhzSSUXCUZ1FrVlZAG11OZ7NnpsEOlpwZ6I5/eSO2rWHMR4rgJEhm0d
	 PHBV8YQGbkVl7uPLz/b7F+ooUCVFE0GIXbycIJJFHcFa7AAP6kisMUpxlAfjDe8N+V
	 PeMotC3dHrSHaeGSi46jWOAMrnYYuSTxGvGOwqOkz19SwsVBoreSGgLf60FePBJGgY
	 +2NipdqmLhj/O+2yJc7x/El/QzN0fosYJk3X/YoO9FJ3W8v8rHkNuZYK1kt1l10Pb/
	 DHIq8jGuxXGOR6QGF+IVwIcukr3Vea7pl2t11bnNZLgeq11KWz6FTRzXn+bjWbo4cL
	 SzyAPoCaPaEeQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 20192F4006B;
	Wed, 21 Jan 2026 11:23:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 21 Jan 2026 11:23:08 -0500
X-ME-Sender: <xms:bP1waWr75g8WVLlQPR4cCcq2sZ36I5kQRQya5JkDLs17piMgzj-N9g>
    <xme:bP1waT6AqCGnH4DLVzXuf62eWI1ozctsKa5YdAd4JkRslcdSLrGl2h_2izB8ZBoSt
    e04JKOhTTwNz8YiV046nkp0ffKYDM4qjMX9Op4D5pavuxew0DKePQ>
X-ME-Received: <xmr:bP1waeBCfc-6qXxD9dmvn676GEjWZNWQ61ZxPs3x6a8V37jlJ1G92yOysOpohA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeefjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:bP1wadaQvEVWs9DXUyfT3s1lo5Zip6gHQJhaS2CoR_KO7RakvsjrDw>
    <xmx:bP1waaI3_me2SXznHCotL9b0czOFjaFwTgjgTNaIeWvAJzCqaFT5PQ>
    <xmx:bP1waeCKlE4NGIqdTvZEDN5ndAW-dPsNNMNo2T3jeIMbQK8MUhNEQg>
    <xmx:bP1waWNImDl_FzfwNs1Urf9ubONYJB4ju_wqQH_58MryfFWFxpjBRw>
    <xmx:bP1waTWulj-lmqsBzD5i31ERa0Agp6vOF2Z4fwKaLHQy_sNSNeCof-Yu>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 11:23:07 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv4 06/14] mm: Make page_zonenum() use head page
Date: Wed, 21 Jan 2026 16:22:43 +0000
Message-ID: <20260121162253.2216580-7-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260121162253.2216580-1-kas@kernel.org>
References: <20260121162253.2216580-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-73503-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,linux.dev,kernel.org,infradead.org,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[kas@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3AB1F5A78D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the upcoming changes to HVO, a single page of tail struct pages
will be shared across all huge pages of the same order on a node. Since
huge pages on the same node may belong to different zones, the zone
information stored in shared tail page flags would be incorrect.

Always fetch zone information from the head page, which has unique and
correct zone flags for each compound page.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/mmzone.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6cfede39570a..390ce11b3765 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1223,6 +1223,7 @@ static inline enum zone_type memdesc_zonenum(memdesc_flags_t flags)
 
 static inline enum zone_type page_zonenum(const struct page *page)
 {
+	page = compound_head(page);
 	return memdesc_zonenum(page->flags);
 }
 
-- 
2.51.2


