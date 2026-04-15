Return-Path: <linux-doc+bounces-83424-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOVtBLXf3mmiLAAAu9opvQ
	(envelope-from <linux-doc+bounces-83424-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2026 02:45:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 699583FF59B
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2026 02:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173F2303F7FE
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2026 00:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6452882DE;
	Wed, 15 Apr 2026 00:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mwe1inbz"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0F12868B4
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 00:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776213912; cv=none; b=eI5Qt+NFRu7VWGmrYpZmxyzhzvS4tIUQDgGjsuS3DOBsQsO5tSkdC0Xh3JyKqX0x1VbdMy0KMQtttDjY04TLsYRVARa8fjbSNxrZAfThAx2iELGKSsdeq9LCRgjztydSVbQJ/AHtoo44rYCCoCwpY/U9XE+DBaH8NI6dRmIQcHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776213912; c=relaxed/simple;
	bh=qejLFQQGcg1KVqXARzAXhEpre213aSYvl+SOgejiSpg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=aLwz4d4JYrayQVaoHj/zZ2LzHUVy/7KziXnMaEVNEO5YZTcadw1BrgAYtzCLy0R5Hqi0kZwVuvvK1Cmo5bog0pqI53CQKVGOJ6wNa4LWkV6qJfIRbUOR8K4eY/5boQm8qRVnet61eMK2fGSHpdT+yZUNq68N1zbSp5pJT869qeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mwe1inbz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C73C19425;
	Wed, 15 Apr 2026 00:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776213912;
	bh=qejLFQQGcg1KVqXARzAXhEpre213aSYvl+SOgejiSpg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Mwe1inbzktTgLt/Ki7sWdn96/InJQ3XFIi3j+t/Dwnh4mtLj8psRP0tzqc8iREo8i
	 eUFtu2jSUTkIYQyX+VRoEAuaiIiOBvO4LCS7N8nEBPcQwnAlNZufTkxmNhLWV7o4Pm
	 eNwozaYefQ/Zen680KJxd+GvKxcdRiaqXQNXy4LlNG3WynY+P4Gj6CuPPtPgzUtdSP
	 WAjP53EhmhuTM2iimMBMPbHMzY6jwYc3pb5sgRyGMHU1t7C01ifZp1pVzFXStgxlSF
	 4r7A5YzgxnsyEhFP9ywurntZZgd/3/cD3G+Gd4eBLGv33gBZRMhndwcMMBPb/qZlMT
	 x1/7fP+l7CQdw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 11EA2F40068;
	Tue, 14 Apr 2026 20:45:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 14 Apr 2026 20:45:11 -0400
X-ME-Sender: <xms:l9_eaalaIa9eyXUeOmkV1U5zninPyBhUKwVoAdxTCiWTF6X6g6YbGQ>
    <xme:l9_eadrapGeexf3sgZIrl692jcXkhZoDvoVuxOfyuJvsYcS5ap56lLaxQYnHTladk
    EistXuyI7nUOxLdnzfV6X-3MDlCXgl8Zur-dXVrhxOFw9No-E5VcUE>
X-ME-Received: <xmr:l9_eaUBEGtPNq-fYupTumRHN3cAqG8PNcey2FK0raEJ8eDLaKkCotaswibKxyGh4VCCxNMdr0TW-hozXb97cRsUlzBx_mG1YO-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegvdeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpeffrghnucghihhl
    lhhirghmshcuoegujhgsfieskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    duvdetgeffhfeftdffudehtdfgffejleeffffhvefhjeejfeekffdugfdviedvgfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepughjsgifodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqddujeejvdeftdegheehqdeffeefleegtdegjedqughjsgifpeepkhgvrhhnvg
    hlrdhorhhgsehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthhtohepuddupdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggsodhhuhgrfigviheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthht
    oheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghr
    nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrih
    hstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihorhhk
    fhhlohifshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegujhgsfieskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdr
    ohhrgh
X-ME-Proxy: <xmx:l9_eaYHMLhmTMgXwROTjmYswnHADt465BbqwIBGVSPzEnuUYbOI3jw>
    <xmx:l9_eaW2PH3Ay1C6xJK39bR1E3YVdXlPT6OKZuNKN1xdhAws3ZpnQ_Q>
    <xmx:l9_eaRPRxgEzKFqJHnflz9zCNgs1WiDt_7IplSW3TajU3OHfdtzw2Q>
    <xmx:l9_eaeYkm2KzN7NQ2HezUGVjV-QizG-5q-5ucLaeOD91aC7HVBeioA>
    <xmx:l9_eaXzYpym6Rq6y3s5WA-MQt0zpEYPcSjGE4QDyz6gKlP8t24auZEeS>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Apr 2026 20:45:10 -0400 (EDT)
Date: Tue, 14 Apr 2026 17:45:09 -0700
From: Dan Williams <djbw@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 Dan Williams <djbw@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <69dedf95ab1fb_147c8010048@djbw-dev.notmuch>
In-Reply-To: <4e9512a3d05942c98361d06d60a118d7c78762b6.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <4e9512a3d05942c98361d06d60a118d7c78762b6.1776176108.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH RFC 1/4] docs: maintainers_include: auto-generate
 maintainer profile TOC
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83424-lists,linux-doc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[djbw-dev.notmuch:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[djbw@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 699583FF59B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mauro Carvalho Chehab wrote:
> Add a feature to allow auto-generating media entry profiles from the
> corresponding field inside MAINTAINERS file(s).
> 
> Suggested-by: Dan Williams <djbw@kernel.org>
> Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Nice!

Acked-by: Dan Williams <djbw@kernel.org>

