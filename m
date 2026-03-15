Return-Path: <linux-doc+bounces-79406-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rkUjOEM5tmm5+wAAu9opvQ
	(envelope-from <linux-doc+bounces-79406-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 05:44:51 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9928FF5C
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 05:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD5393043D5A
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 04:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E8E19539F;
	Sun, 15 Mar 2026 04:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyberialabs.net header.i=@cyberialabs.net header.b="y0Y1Oocr";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="bqSn7Igk"
X-Original-To: linux-doc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDC916CD33
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 04:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773549888; cv=none; b=pSyzw1hPrYSH/xBy8/dhKuc/cmln9egC3FZWlGbzv2e4QGhsBOj/kKsOYEJ/YR1FNyu3d1eo2P/vxoGrC49dAF6sIMD69YbI2HrjfeLy5Uj2betOVrHV5zqhRUi+Q2ediNUu5i1NypZzekRDjWYR3CU7KX8iYgM0BLWHMRAjMMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773549888; c=relaxed/simple;
	bh=GUGXum2nqhCVs3VZdM1TKA46YirczaWn6gnaDBhw3HI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=JNAR2npDafdhSTq3dp4dt/xch0ODoXWkOnKoBL68vjlyYTT6eqB61BYueFatLv467N16FGay/hQBtBqd5KriANe1F4aIq334P+asEIywALbV9MjUVsjKDULPLrZH9sDteZILvKcnQejQbgr4ai9ANsH6izIuI5RHhLVnxAtr6OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberialabs.net; spf=pass smtp.mailfrom=cyberialabs.net; dkim=pass (2048-bit key) header.d=cyberialabs.net header.i=@cyberialabs.net header.b=y0Y1Oocr; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=bqSn7Igk; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberialabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberialabs.net
DKIM-Signature: a=rsa-sha256; b=y0Y1Oocr3S7FgOmEhvb29qAW5qnqqElhbW4Fa0dTQzy8yu7Dowg13Z4KJLQhllmnkoWH/1ePvf5PBFKhLKRBz8xeT/zOO7aoE/VabzSwsvGOwvfBk9MllLwKVeipLyWkqk06m9DEpcnLaTDWbghedgwQu6IhZ8ES8txMg7v4wmX5Krtv/NYTZT2jsOIiCilGRKSNhNmL8LifqrStSOgPCXHIX31hZW4PFmznbWsWtVPO7TovWs+XCIg4Zn14kwcCdU/00wQliW/FAB4Y4olTfxDJUXDXgX2soGg8fobuR5FeVMUXtYuqdlZcRtCtlUY2da2W0Id2y9mNHo1pWlJ1tw==; s=purelymail2; d=cyberialabs.net; v=1; bh=GUGXum2nqhCVs3VZdM1TKA46YirczaWn6gnaDBhw3HI=; h=Received:Date:From:To:Subject;
DKIM-Signature: a=rsa-sha256; b=bqSn7Igk2/p+ATZXB4jy34kwgjLcqUNs4Ma3F9OxBpogJXJ6w079cjNCESgulDGDekB5iU6tsRzuqE1tEmWqguUmKOlz9y02OGGaYS23HFj3O//fq3zsXV1nUseb2qRXTHunDy6NhQ1HuNegJxAk3jmnMsrpVe5D501L+z0DoFD81xoIftUT7tg/v5r9Eatc7EJTQaWMmJuR1ROgTg2pl9yivui5UyJj5ChEb8vOBdjZUCScIl2X8Yy1KrK1k0ABkEUHQlhdMUNhIhqWOvHsA+2+SQoY9H4Yd1dhrG2TWPnhw4RcX6XOLqm9lrV++ek8hCHHh8l+JGBnLX52p1FWlA==; s=purelymail2; d=purelymail.com; v=1; bh=GUGXum2nqhCVs3VZdM1TKA46YirczaWn6gnaDBhw3HI=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 6229:1532:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPA id 1342528512;
          Sun, 15 Mar 2026 04:44:31 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 14 Mar 2026 21:44:31 -0700
From: Alexander Coffin <alex@cyberialabs.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kbuild: Update the debug information notes
 in reproducible-builds.rst
In-Reply-To: <20260313-kbuild-docs-repro-builds-fdebug-prefix-map-updates-v1-1-3aeeef7fa710@kernel.org>
References: <20260313-kbuild-docs-repro-builds-fdebug-prefix-map-updates-v1-1-3aeeef7fa710@kernel.org>
User-Agent: Purely Mail via Roundcube/1.6.11
Message-ID: <54c081d15d727c87a6e6fce35f2ba561@purelymail.com>
X-Sender: alex@cyberialabs.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cyberialabs.net,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[cyberialabs.net:s=purelymail2,purelymail.com:s=purelymail2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79406-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cyberialabs.net:+,purelymail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@cyberialabs.net,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cyberialabs.net:dkim,purelymail.com:dkim,purelymail.com:mid]
X-Rspamd-Queue-Id: 6EC9928FF5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nathan,

I finally got around to reviewing the reproducible builds again and I'm 
pretty sure it is supposed to be `-ffile-prefix-map` (not just 
`-fdebug-prefix-map`) with KCPPFLAGS to also handle macros, but I could 
be mistaken. I can try to build the kernel reproducibly again, but it 
has been a while since I did this (sorry).

- Alex

