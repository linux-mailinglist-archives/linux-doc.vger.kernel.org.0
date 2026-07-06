Return-Path: <linux-doc+bounces-95045-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4YzvG0BaS2qRPwEAu9opvQ
	(envelope-from <linux-doc+bounces-95045-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 09:33:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1032170D960
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 09:33:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=sk.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95045-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95045-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E297031FDD58
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 06:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF003DA5D9;
	Mon,  6 Jul 2026 06:20:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE57B3C1960;
	Mon,  6 Jul 2026 06:20:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783318812; cv=none; b=uQwRyeFpCcbeLoTwY0CmuUyY653AoNZpxjUZUN+Ref/nC2clynMxFJTKpOqxDUJCLdOjHE4oZfFfwhCZCkNBLOaexL6AHWCGnNvtXMER2DWIS31WQ84KrQ9MqAIUVR3BG24C4jQtqNTAywCkKi1zyJzPLQW5NvnInioiw1oGIsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783318812; c=relaxed/simple;
	bh=kGgEzobFbLUd8tx4gLWx/R771yHZRXgu8kLDW12YZyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=W7OkX/NWJ2xEQoG9vQajYJlAiKg4VGzp90W0dJhreJUWcVw8HaEgdOYrPws5CnWeSDIP3TwrMrOBsdiIrmZpykd2x27TjF8g8OfqVdHx1qRxYw9/MH9oC1zGY3dlKGj1k+vRKXZLxZ4nLa1CVxsULRL6FQBL/XCJkSmdPpOuAZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
X-AuditID: a67dfc5b-c2dff70000001609-4f-6a4b48fda1b6
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: max.byungchul.park@gmail.com,
	kernel_team@skhynix.com,
	torvalds@linux-foundation.org,
	damien.lemoal@opensource.wdc.com,
	linux-ide@vger.kernel.org,
	adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	will@kernel.org,
	tglx@linutronix.de,
	rostedt@goodmis.org,
	joel@joelfernandes.org,
	sashal@kernel.org,
	daniel.vetter@ffwll.ch,
	duyuyang@gmail.com,
	johannes.berg@intel.com,
	tj@kernel.org,
	tytso@mit.edu,
	willy@infradead.org,
	david@fromorbit.com,
	amir73il@gmail.com,
	gregkh@linuxfoundation.org,
	kernel-team@lge.com,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	mhocko@kernel.org,
	minchan@kernel.org,
	hannes@cmpxchg.org,
	vdavydov.dev@gmail.com,
	sj@kernel.org,
	jglisse@redhat.com,
	dennis@kernel.org,
	cl@linux.com,
	penberg@kernel.org,
	rientjes@google.com,
	vbabka@suse.cz,
	ngupta@vflare.org,
	linux-block@vger.kernel.org,
	josef@toxicpanda.com,
	linux-fsdevel@vger.kernel.org,
	jack@suse.cz,
	jlayton@kernel.org,
	dan.j.williams@intel.com,
	hch@infradead.org,
	djwong@kernel.org,
	dri-devel@lists.freedesktop.org,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	hamohammed.sa@gmail.com,
	harry.yoo@oracle.com,
	chris.p.wilson@intel.com,
	gwan-gyeong.mun@intel.com,
	boqun.feng@gmail.com,
	longman@redhat.com,
	yunseong.kim@ericsson.com,
	ysk@kzalloc.com,
	yeoreum.yun@arm.com,
	netdev@vger.kernel.org,
	matthew.brost@intel.com,
	her0gyugyu@gmail.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	sumit.semwal@linaro.org,
	gustavo@padovan.org,
	christian.koenig@amd.com,
	andi.shyti@kernel.org,
	arnd@arndb.de,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	rppt@kernel.org,
	surenb@google.com,
	mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	urezki@gmail.com,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	chuck.lever@oracle.com,
	neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	trondmy@kernel.org,
	anna@kernel.org,
	kees@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	mark.rutland@arm.com,
	ada.coupriediaz@arm.com,
	kristina.martsenko@arm.com,
	wangkefeng.wang@huawei.com,
	broonie@kernel.org,
	kevin.brodsky@arm.com,
	dwmw@amazon.co.uk,
	shakeel.butt@linux.dev,
	ast@kernel.org,
	ziy@nvidia.com,
	yuzhao@google.com,
	baolin.wang@linux.alibaba.com,
	usamaarif642@gmail.com,
	joel.granados@kernel.org,
	richard.weiyang@gmail.com,
	geert+renesas@glider.be,
	tim.c.chen@linux.intel.com,
	linux@treblig.org,
	alexander.shishkin@linux.intel.com,
	lillian@star-ark.net,
	chenhuacai@kernel.org,
	francesco@valla.it,
	guoweikang.kernel@gmail.com,
	link@vivo.com,
	jpoimboe@kernel.org,
	masahiroy@kernel.org,
	brauner@kernel.org,
	thomas.weissschuh@linutronix.de,
	oleg@redhat.com,
	mjguzik@gmail.com,
	andrii@kernel.org,
	wangfushuai@baidu.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	2407018371@qq.com,
	dakr@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	neilb@ownmail.net,
	bagasdotme@gmail.com,
	wsa+renesas@sang-engineering.com,
	dave.hansen@intel.com,
	geert@linux-m68k.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v19 09/40] dept: record the latest one out of consecutive waits of the same class
Date: Mon,  6 Jul 2026 15:18:57 +0900
Message-Id: <20260706061928.66713-10-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260706061928.66713-1-byungchul@sk.com>
References: <20260706061928.66713-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxiGfc95z3tOO7qcdGY7Qxe2qpuDqWNT8pgs2iVmO9E/JvBnH4k7
	kWYUWiAHZWLYgm5tAGlT6oCMWqkWiZGi2K5GgU4+Jjj5GEhsug3FZQGCHXUrIAFbWYvZvzvX
	c9/Xr4ej1b8xqZy+8IhOLpQMGqLEyrmU89tWxQP57/b5GDhzxUNg9HIrgri9n4XVQD8Cz48n
	KJhvf0Yg3BdF8LilBsHcZCcD8foCeDr8Kw1TNj8NkXYCrpMBBsaGwgicDjuCGw87WBgLxygY
	tJ2noGGWgKPhWwrq2jopGHJPYGip2ALhaTuByo5FDN6/ggwEfs+Ac+ZmDF2BXzCMd5wh8MCz
	ykCFY4mBKzOhhKz/NoY/H4YY8A0P0TBaa2EgZJtCcDoyjeBEjxuD/6YJgXn+GQMDlm4KLixE
	aJiwPsJgbr5KgdcTJDDT6KTgzv15Fk7fdRHweetoCNqbCESdiZmpZpmF1jEMdbFKAqdM9Qnn
	rSUWrCMfg3MhE9riQQQR2wIDjlsPWK1WXDJZsWi6Gyei56wHiU9X7Ei8MPg3EVcW7xGxuWqF
	EmuHt4k3Gu+zost7VPRdTBfdXbOUeC66yIjeS1VE9EbtrDgR7CIHNZ8qP8jVGfSlOnnHni+U
	ecGGk7h46oVj/1oeoQr0s6IaKTiB3yn0TV5lqxG3lpvqDUlM+LeEUGiZTub1/OuCzzLNVCMl
	R/PjaUJNiwUn+y/xkjDQuDXZwfwWYbbKj5NZxWcJ3/st1HN9mtDa3r3mUST45Zhzjav5XcIf
	jwdw0inwPoVgXegmzwevCj0XQ9iGVC607hJS6wtLjZLesHN7Xlmh/tj2w0VGL0o8XMvXsc+u
	o+hodi/iOaRJUYF2f76akUpLyoy9SOBozXrVm1sP5KtVuVLZcZ1cdEg+atCV9KINHNa8onrv
	yVe5av5L6YiuQKcr1sn/XylOkVqBNm+2Lb8sGf0pbcc3tPePbJIPWXoDu/fmMO8UZf/gc2gN
	qQXmjyqrvN9Nvr2Srd1vnPlwLkJe3OF7P2vdJ1339t3c1Hp9l1y8tzyjdu7skxH3az+Fy7J6
	cmT3nttL4+mneq7FrXcyzPtcb8RGynOCmf9omz7fGB79ZrAzrYBezCkP5GlwSZ6UmU7LJdJ/
	7tbiI2wDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUxTZxTGfd/79vbSreymYrxxZtYmfibiR6Y52YxzyyLvUJa5GHWLiTR6
	MwqlmJahmMxBWbPKxECztkphMja6CVWwpcyONBKc+IFuMFSIikBSO/moddiCfBTWmuyfk995
	znOenD8OxyhaJEs4jS5f1OvUWhUrI7KP3y1ZF6M7szcEhxaB2fQ1PBoISOB+cRuBaMRMoKrR
	xULM8ZsUzO6zErjRayTQdbEBwUDUjGByxsGAyTdPIGbpkEJk6qEUrMUI5v0dCGzdFgb6uq4w
	4GouxvCiaY6F0avjCKxDARbsw8UEws5TCCqDDikMX0uD0ECrBOb7/8HQOzGGwBmYwxBo+xZB
	zJYD52o98XXbcxZm7vzFgN3aheDHoX4GxocHETR3PEbg/9XIwpNyLwM9gWS4Gw2zcNP6HQuh
	7ioMz5pYqDH6JdB9exRBtcOCIPjAj6Hkp0YWbNVuAr7B36XQPTqL4ZHNgqHBnQEDziCBzvJa
	HD837rq0GBz2EhwvTzFYL7RimHLWS7fXITppOk1ovacFU9PfMZa6fnAhOjNtQTRSV8JQU3m8
	vToWZug3nqO0rnOMpdPReyz1T9QQeqtWoD+fnMa04s466qvsl37y/ueyrYdFraZA1K/flinL
	um83kiNPXjv2b9kIKkJ/JJUijhP4t4VzNm0pSuJYfpXQ1zfFJDiFVwqesqCkFMk4hu9ZJpxy
	lpGEfyGvFq5Xrk54CL9CGD7pJQmW81uE771lOMECv0xoaGp7lZMU1y/OVr/SFfxm4WH4OilH
	shq0oB6laHQFuWqNdnOqISerUKc5lnooL9eN4t/k/Gq24jKK9KS1I55DqtflsD09WyFRFxgK
	c9uRwDGqFPnK1TuzFfLD6sLjoj7voP5LrWhoR29yRLVYnr5PzFTwX6jzxRxRPCLq/59iLmlJ
	EVo/M/l8xJmVtyHT/eLTzL3LXbrI8bSwYsK49mb2NvbDkMerpKEP7r2XMXcldvCNqvyMz5TK
	j6K9e3z1l996WtR/YvC81N16djL9WajTu/uXpSs2rTnxznLf/v3U32LHXoUn19y8JrXiwAiX
	vGNTLz9undc2vVyAd201K/9sbD+afEZFDFnqjWsZvUH9H6rrtARJAwAA
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[sk.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,skhynix.com,linux-foundation.org,opensource.wdc.com,vger.kernel.org,dilger.ca,redhat.com,infradead.org,kernel.org,linutronix.de,goodmis.org,joelfernandes.org,ffwll.ch,intel.com,mit.edu,fromorbit.com,linuxfoundation.org,lge.com,kvack.org,cmpxchg.org,linux.com,google.com,suse.cz,vflare.org,toxicpanda.com,lists.freedesktop.org,oracle.com,ericsson.com,kzalloc.com,arm.com,lwn.net,alien8.de,zytor.com,linaro.org,padovan.org,amd.com,arndb.de,suse.com,nvidia.com,joshtriplett.org,efficios.com,linux.dev,suse.de,brown.name,talpey.com,huawei.com,amazon.co.uk,linux.alibaba.com,glider.be,linux.intel.com,treblig.org,star-ark.net,valla.it,vivo.com,baidu.com,lists.infradead.org,lists.linaro.org,lists.linux.dev,qq.com,ownmail.net,sang-engineering.com,linux-m68k.org,garyguo.net,protonmail.com,umich.edu];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:max.byungchul.park@gmail.com,m:kernel_team@skhynix.com,m:torvalds@linux-foundation.org,m:damien.lemoal@opensource.wdc.com,m:linux-ide@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-ext4@vger.kernel.org,m:mingo@redhat.com,m:peterz@infradead.org,m:will@kernel.org,m:tglx@linutronix.de,m:rostedt@goodmis.org,m:joel@joelfernandes.org,m:sashal@kernel.org,m:daniel.vetter@ffwll.ch,m:duyuyang@gmail.com,m:johannes.berg@intel.com,m:tj@kernel.org,m:tytso@mit.edu,m:willy@infradead.org,m:david@fromorbit.com,m:amir73il@gmail.com,m:gregkh@linuxfoundation.org,m:kernel-team@lge.com,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:mhocko@kernel.org,m:minchan@kernel.org,m:hannes@cmpxchg.org,m:vdavydov.dev@gmail.com,m:sj@kernel.org,m:jglisse@redhat.com,m:dennis@kernel.org,m:cl@linux.com,m:penberg@kernel.org,m:rientjes@google.com,m:vbabka@suse.cz,m:ngupta@vflare.org,m:linux-block@vger.kernel.org,m:josef@toxicpanda.com,m:linux-fsdevel@vger.kern
 el.org,m:jack@suse.cz,m:jlayton@kernel.org,m:dan.j.williams@intel.com,m:hch@infradead.org,m:djwong@kernel.org,m:dri-devel@lists.freedesktop.org,m:rodrigosiqueiramelo@gmail.com,m:melissa.srw@gmail.com,m:hamohammed.sa@gmail.com,m:harry.yoo@oracle.com,m:chris.p.wilson@intel.com,m:gwan-gyeong.mun@intel.com,m:boqun.feng@gmail.com,m:longman@redhat.com,m:yunseong.kim@ericsson.com,m:ysk@kzalloc.com,m:yeoreum.yun@arm.com,m:netdev@vger.kernel.org,m:matthew.brost@intel.com,m:her0gyugyu@gmail.com,m:corbet@lwn.net,m:catalin.marinas@arm.com,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:luto@kernel.org,m:sumit.semwal@linaro.org,m:gustavo@padovan.org,m:christian.koenig@amd.com,m:andi.shyti@kernel.org,m:arnd@arndb.de,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:jo
 sh@joshtriplett.org,m:urezki@gmail.com,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:chuck.lever@oracle.com,m:neil@brown.name,m:okorniev@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[byungchul@sk.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-95045-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[byungchul@sk.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[165];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sk.com:from_mime,sk.com:email,sk.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1032170D960

The current code records all the waits for later use to track relation
between waits and events within each context.  However, since the same
class is handled the same way, it'd be okay to record only one on behalf
of the others if they all have the same class.

Even though it's the ideal to search the whole history buffer for that,
since it'd cost too high, alternatively, let's keep the latest one when
the same class'ed waits consecutively appear.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 kernel/dependency/dept.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 4b4b28ddc819..3af360ba17d8 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1486,9 +1486,28 @@ static struct dept_wait_hist *new_hist(void)
 	return wh;
 }
 
+static struct dept_wait_hist *last_hist(void)
+{
+	int pos_n = hist_pos_next();
+	struct dept_wait_hist *wh_n = hist(pos_n);
+
+	/*
+	 * This is the first try.
+	 */
+	if (!pos_n && !wh_n->wait)
+		return NULL;
+
+	return hist(pos_n + DEPT_MAX_WAIT_HIST - 1);
+}
+
 static void add_hist(struct dept_wait *w, unsigned int wg, unsigned int ctxt_id)
 {
-	struct dept_wait_hist *wh = new_hist();
+	struct dept_wait_hist *wh;
+
+	wh = last_hist();
+
+	if (!wh || wh->wait->class != w->class || wh->ctxt_id != ctxt_id)
+		wh = new_hist();
 
 	if (likely(wh->wait))
 		put_wait(wh->wait);
-- 
2.17.1


