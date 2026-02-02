Return-Path: <linux-doc+bounces-74886-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL38ByXKgGnQBgMAu9opvQ
	(envelope-from <linux-doc+bounces-74886-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 17:00:37 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 33482CE914
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 17:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C15C33004D95
	for <lists+linux-doc@lfdr.de>; Mon,  2 Feb 2026 15:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCBD30F931;
	Mon,  2 Feb 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Klu0DsYu"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4963814AD0D;
	Mon,  2 Feb 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047880; cv=none; b=Q3elC9ELuzT5OhOd6CMaI4hiNyZcIQ4iQnY3YVxRb7LF3B1XZjfHoGhu96jR5h8Pk5HwJOmmkPJdVnkc9JSfxd4dxNharz4LfUS9iBAhgbOo5csQFyd0ynUAf8X3nzZrdpcAQUE015u5bBeI+GVW6c2W74t9TEkSyoGRUAcyJOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047880; c=relaxed/simple;
	bh=WA5hQUJoQwTD5DQSyUz0pDcyfXp3ks3On7x7VB179to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzfrrcv4AcLPvbQ/yhlaGo/bLjN/LfFvqDDrqlHuX01jkdpJjaHRdvxgqRBlY7hQ8yvZvJtWZpjMeRHMPhifL8dJcANt/GTJIj3X+tu5YAQOlh/XagluMMynS9xy1sj7pC141OsnjTzqTrDE+i2NXdQjc7/BJWUwTa8enj4Q/cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Klu0DsYu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D08C2BC9E;
	Mon,  2 Feb 2026 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047880;
	bh=WA5hQUJoQwTD5DQSyUz0pDcyfXp3ks3On7x7VB179to=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Klu0DsYuaYozCwLNGavUAlPZy2KjbSwvgiApyFwgXkNmjidWLu+q9teR78UWmj9VG
	 X3ZC4Y+hm4yPvYf7iUhKp2TEYn73Z0WBfL+GeRYqhGvE/5bQ+MoftRP+leQnZ/i1ew
	 a7lgbkUw9wlGYIkc+XNt/CG37pLcmV7ahGuPSV6lyFf6WyzBLtarUJUg0wGck4DAaY
	 7bhNoPvNT0xdlNpTgfIL/Hm32CMRfrPXbo0dfWMiyeLsFNw2NQbfP4d6z+l/aTHuiW
	 tqpQoC9pn6yLtsX4i5ifdzl+VbHJStIw4v1wl83hghe2iWBkoo4yaqtTp8N2L8nR/5
	 Xp8H5NUh5Wj4A==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 47309F40069;
	Mon,  2 Feb 2026 10:57:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 10:57:58 -0500
X-ME-Sender: <xms:hsmAaTBQZnR96Q91CZbmjPSTynsTVNZHY1DrMuXy2dOUuuY5IVSovw>
    <xme:hsmAaStOjFcQZEGn751h8X3BtKm2h7RP9etcmAKofmY0s7nHtkRsl7PaXQzIiEMmS
    JN9IyHyC_QB5o_wf4KSpLcS4db3EGHqpT0r303vTIlHGddgIbOaa3o>
X-ME-Received: <xmr:hsmAaYvLSawEGBnSu6hIZGeYAtPiRYjKtE7pbBIAio-yUv6gc6DVSi73tcilPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:hsmAaWrfkRMR-C481qatfZVcrV7WP255E9JiKBpBFYHu34vxe6T1sw>
    <xmx:hsmAaUNGSCpkDpGg21FjG5PCQVfurMWNdvxf_13zAqbCu9oHDe3Klw>
    <xmx:hsmAaUmg9Ut75Ri69ArrFnTmH23UMAcC5eOYZyJ9ln4p8ruiWiuQ_w>
    <xmx:hsmAaes8SEOO3JrV17-fS01MfuAA7GyPcoxf10sWs9kU9GIckuILmQ>
    <xmx:hsmAaTnyKO1nCmkLtmeUgvlHwZhpCCTOlpIMK0dE-1r-Nd8eLa9G01Sf>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:57:56 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv6 09/17] mm/sparse: Check memmap alignment for compound_info_has_mask()
Date: Mon,  2 Feb 2026 15:56:25 +0000
Message-ID: <20260202155634.650837-10-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-74886-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux-foundation.org,linux.dev,redhat.com,infradead.org,gmail.com,google.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kas@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:email];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 33482CE914
X-Rspamd-Action: no action

If page->compound_info encodes a mask, it is expected that vmemmap to be
naturally aligned to the maximum folio size.

Add a VM_BUG_ON() to check the alignment.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
---
 mm/sparse.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index b5b2b6f7041b..6c9b62607f3f 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -600,6 +600,13 @@ void __init sparse_init(void)
 	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
 	memblocks_present();
 
+	if (compound_info_has_mask()) {
+		unsigned long alignment;
+
+		alignment = MAX_FOLIO_NR_PAGES * sizeof(struct page);
+		VM_BUG_ON(!IS_ALIGNED((unsigned long) pfn_to_page(0), alignment));
+	}
+
 	pnum_begin = first_present_section_nr();
 	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
 
-- 
2.51.2


