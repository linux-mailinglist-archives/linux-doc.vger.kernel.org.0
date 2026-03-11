Return-Path: <linux-doc+bounces-78867-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIDwDE+NsWnkDAAAu9opvQ
	(envelope-from <linux-doc+bounces-78867-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 16:42:07 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FCE266B37
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 16:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC7EA300680C
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 15:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9589E3D88F2;
	Wed, 11 Mar 2026 15:33:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4255F359A87;
	Wed, 11 Mar 2026 15:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243211; cv=none; b=N7vNoTRVwHmTghTdnZOqoxk1qiEMt/l6sEOTqcwV5l2uqRMjVkE+ENVNhr9RM4jTkvfhiUBFs+1rruyqVZPbZnWqCHsO/MfJSg2BfjXfrDdCuPdxMJr9GvonnHyFpL6Z5tO2VOkTnHCL5arpoJPQFag0vGR/8R6wL6PMYElXI88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243211; c=relaxed/simple;
	bh=eArf8XV28ZdsX5wVVA5kj1kz4tJ/mnHzflWkBbl6uRc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Ik8GFHdsaV6bXPlselb+8PJK8HSQJrU9uIobc8xtaZKwU+SdqEjUc4ZtKefV6+eMDMaDszrFbbFqosRMsDl/ZRzJBEITssyqT6RWt0k1FdTPYkAd8qHzGBt6CcFCSEjHfloCQZ0axaUc6YWhSh3oSXf5AMyUR+orAMLEHEithTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 77654160278;
	Wed, 11 Mar 2026 15:33:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id CA3CC20025;
	Wed, 11 Mar 2026 15:33:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Mar 2026 08:33:26 -0700
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Bart Van
 Assche <bvanassche@acm.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] checkpatch: add support for Assisted-by tag
In-Reply-To: <20260311152039.254244-1-sashal@kernel.org>
References: <2c7e0149-c178-41b8-ac5e-270bfea8b1f8@acm.org>
 <20260311152039.254244-1-sashal@kernel.org>
Message-ID: <65ad15f96429d87225867e982cd1aab2@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Stat-Signature: j6ybqnydccxwzbu1jraidygxp45ida3q
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX199J1/Lyv/05lRw1Cwyic7B+6lq4pQYUN0=
X-HE-Tag: 1773243206-208298
X-HE-Meta: U2FsdGVkX19/HbGXseilaYuq0rutGZzeUlhAWvqSGGCIsyaHvUq18FPeTkaqpHQNxXNQZeLWmuPpFHbnilxOLhciND/pjXZK+PtKLwwAZFJ+giUwWDS7vA1a77eP64DdaZoQX1MLiAdezpztYw0rhioLJkL2zwGUVdstswsJYyoK2xzWTbfnz191RkmQ3hsvoz9Vwd4xRk8GVQ1cuhrQuvhJ4HVVvZ47q81QDo6L1slaUEH8aSS3p3wGfiXJ5W6KjNFoEm2gGTgxtUGJ7IkIXw==
X-Spamd-Result: default: False [8.84 / 15.00];
	URIBL_BLACK(7.50)[perches.com:mid];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[canonical.com,gmail.com,acm.org,lwn.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-78867-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[perches.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 29FCE266B37
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On 2026-03-11 08:20, Sasha Levin wrote:
> The Assisted-by tag was introduced in 
> Documentation/process/coding-assistants.rst
> for attributing AI tool contributions to kernel patches. However, 
> checkpatch.pl
> did not recognize this tag, causing two issues:
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3105,6 +3106,13 @@ sub process {
>  				}
>  			}
> 
> +			# Assisted-by uses AGENT_NAME:MODEL_VERSION format, not email
> +			if ($sign_off =~ /^Assisted-by:/i) {
> +				if ($email !~ /^\S+:\S+/) {
> +					WARN("BAD_SIGN_OFF",
> +					     "Assisted-by: expects 'AGENT_NAME:MODEL_VERSION [TOOL1] 
> [TOOL2]' format\n" . $herecurr);
> +				}

I believe you could use next instead of this odd indentation avoidance.

