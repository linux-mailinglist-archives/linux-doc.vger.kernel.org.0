Return-Path: <linux-doc+bounces-86097-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA9pFrF8+2lQbwMAu9opvQ
	(envelope-from <linux-doc+bounces-86097-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 19:38:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FD64DEED8
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 19:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C0E43034DCD
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2026 17:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12874BC01A;
	Wed,  6 May 2026 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="NddnxEGf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDAC47D93A
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088989; cv=none; b=Os6bxsBN2z4cMkoAeEou6zzXA2OZxftl+0KxYb409gkxFkUyBbiBFqvrV4LSsaiqYX4470zsXsUvAVn+aByjDMgHNNIxeYci/etKjZocB0t0tWoqLB/zW1+euMi/wbf2qUrgJvod2VeOOaovIb4GedTSN8X51VNc+xcvYCvztJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088989; c=relaxed/simple;
	bh=WQF14NSC+4NdljM3IedG9+xpMVExmIxK5jwnFJEcjtI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jmhB5DIV/P1miikrDiW5DgOVclxrCjyL/g/JxfvNU1YZ1NL/PK5H6PPpoQZgjduNzgYOc2EhQH3VdhzFlXTgYiIkNwAxLtquADn8iRkDzblc2ej+P5UL6rc00ZzG6ttodQiNDbsKVKHUYvE/AKv1Ji9QG7JYUXCFY7lidNDDm4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=NddnxEGf; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1778088979; x=1778348179;
	bh=WQF14NSC+4NdljM3IedG9+xpMVExmIxK5jwnFJEcjtI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NddnxEGfXsHf4+5GUkx8WCzEQWjq9TIXhZfOpqzO9vWy2qgdeh+oTHj7XNHFHnKdg
	 dxuA0kqP06vpBkYSG1G5cTgl0LQT5JFCI41bu0pdFaUcTWl71Zr1fXLRI79SgEzZfN
	 CBfsrGSyMQdzcl+lmqE6Z3qjUkceOjEp1BwpYn2v0sKpt0MImFjkqncaduJevjk1YO
	 IPXLG2HMmUvSigIuqqnYS+a4q6LVI9SVe8yArXKAt1LoqoKH7rdofiNHoNdozvfwgb
	 bwPhR3w19OV0B4wxpnjJYe0D2mjuARmThuZlftuuQUt+awY9zB2v1CtMF9hP1oSIBB
	 Imjt1fDsc5dkA==
Date: Wed, 06 May 2026 17:36:16 +0000
To: Thorsten Leemhuis <linux@leemhuis.info>
From: Felipe Matarazzo <felipemps@protonmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: fix typos in reporting-issues.rst
Message-ID: <d6f0dc5a-d6e2-4512-a7d6-6512a8d085a8@protonmail.com>
In-Reply-To: <45e18079-ab21-478b-904d-41dc67041f71@leemhuis.info>
References: <20260503232816.70687-1-felipemps@protonmail.com> <45e18079-ab21-478b-904d-41dc67041f71@leemhuis.info>
Feedback-ID: 9620817:user:proton
X-Pm-Message-ID: 049a0fb3eff372e8027051db14d8d0fed4e158a5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B4FD64DEED8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-86097-lists,linux-doc=lfdr.de];
	FREEMAIL_FROM(0.00)[protonmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felipemps@protonmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:dkim,protonmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Thorsten,

Thanks for the review and the Acked-by!

You're right about the underline =E2=80=94 the kernel test robot caught the=
 same issue [1],
so v2 already addresses both the underline length and includes the Reported=
-by tag.

[1] https://lore.kernel.org/oe-kbuild-all/202605041002.NG14fe8J-lkp@intel.c=
om/

Thanks,
Felipe


