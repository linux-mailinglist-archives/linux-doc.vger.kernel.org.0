Return-Path: <linux-doc+bounces-84615-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hc8nG7I37WmkgwAAu9opvQ
	(envelope-from <linux-doc+bounces-84615-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 25 Apr 2026 23:52:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CAE467EAA
	for <lists+linux-doc@lfdr.de>; Sat, 25 Apr 2026 23:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52C923009B2A
	for <lists+linux-doc@lfdr.de>; Sat, 25 Apr 2026 21:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D16935CBC3;
	Sat, 25 Apr 2026 21:52:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2015133D4EC;
	Sat, 25 Apr 2026 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777153966; cv=none; b=rPzq+bzej+M0zJMFK+4DIVkI/XKOife26dBdrzSjyINaXJ7CmBXSAss+PjJcmzoU1d65U8SyGIoXpgORsNNBm6ZTht3lNJQPwm0hA37XbHz7SeXqF1GCmUxLz8fmzspf0s9eyDYIEU3iGmMyVW/JJX+IoqWBwS4ghujAcd7tK2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777153966; c=relaxed/simple;
	bh=UhL41mXg8ziVEqtgu83cmbHSWGzlj4WOdVNq/8KGSgc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Khhbt6GJJ4YjLD55b3C1oQaTeT+1CnPNQf+DNG1e5zRn2ocleFzU2O6eDeGcvHwGozcMpoRAcGbV3ATs7ouD+kMJToNXn+BdfbF+py817jefNtUZD5EkC9EIT+kg9OLGcBG5uQCNvQPs8gSJyMq4VKC1La1alBLWidIJxfyAnt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf07.hostedemail.com (lb01b-stub [10.200.18.250])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id ABB788B75D;
	Sat, 25 Apr 2026 21:52:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id EAF9020032;
	Sat, 25 Apr 2026 21:52:35 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 25 Apr 2026 14:52:35 -0700
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>
Cc: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, mricon@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, apw@canonical.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] checkpatch: add --json output mode
In-Reply-To: <20260425200431.4088895-1-sashal@kernel.org>
References: <20260408172435.1268067-1-sashal@kernel.org>
 <20260425200431.4088895-1-sashal@kernel.org>
Message-ID: <c8722587377c3bc4be03f7d04bd45912@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Stat-Signature: tiuciup4461hf6a7gb7191af384um5i9
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/qOiV58/uLk+42lJQkNJieerRBMCYA82c=
X-HE-Tag: 1777153955-898928
X-HE-Meta: U2FsdGVkX1/rKdd50ZWp8CyvIs0bFe5epmzPoNvjz73JP0od6DBM81G+zDQ+i1G8UK6HJ6rNJQSicrAW0Tkvjr7l3sIqzuP+aDtN4vwPCSB4BIxzv+vMmwUxghggsL+wWCp8IjL1527twnG387FIFGRAuBIRevGhTo2St5a0Fh5t4x5U3j3TQeIc9pReDd5l2TrOLxQaYNEoRV6pS1RjmVMUHtB/i26ygVcHXVl3Ya3/i5FoCey4ezt8NrEtf6Naqf1+zwebmAUPOL8yQCxptg==
X-Rspamd-Queue-Id: B9CAE467EAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lwn.net,linuxfoundation.org,canonical.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[perches.com];
	TAGGED_FROM(0.00)[bounces-84615-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]

On 2026-04-25 13:04, Sasha Levin wrote:
> Add a --json flag to checkpatch.pl that emits structured JSON output,
> making results machine-parseable for CI systems, IDE integrations, and
> AI-assisted code review tools.
[]
> A separate --json-pretty flag emits the same JSON in a pretty-printed
> (indented, multi-line) form for human reading

Why not just always use pretty?
Would a script care?

