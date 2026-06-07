Return-Path: <linux-doc+bounces-91236-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mY1uKPRcJWr3HQIAu9opvQ
	(envelope-from <linux-doc+bounces-91236-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 07 Jun 2026 13:58:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B36507E0
	for <lists+linux-doc@lfdr.de>; Sun, 07 Jun 2026 13:58:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QMjl1xiS;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91236-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91236-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B92D3011871
	for <lists+linux-doc@lfdr.de>; Sun,  7 Jun 2026 11:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032A434FF40;
	Sun,  7 Jun 2026 11:58:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E251630C17C;
	Sun,  7 Jun 2026 11:58:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780833497; cv=none; b=pmblBCicsfSMYDSVsVPE9/jZYtDTOUFvABGOILJ7DI3TsVKFG+8YlpMXonXlH0jPNjIJ16u4NmVyuYQoMa/79GVNe55s2FJ+DtVjZsd7zVJ73V4JfFCqT1bNgQnWlf43mR+1ipDHybxyNIYGC6/+XodMViPT+ZVMoK4S7K9vB7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780833497; c=relaxed/simple;
	bh=sHNqQ6sBVxrgcaxGECrC124JvbJtc9sZDSizM2oMdzc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kmG+5vT/Tb6cpDFFRqKY7NPtexJBGpbZkSbxB4MM+IDPjhf2brlUiTons9yW9dAL9m5Lhhybm0qoDGHm9QGR/g0lPVWf7/ChCpcmkokcgBaE+xtGSTpKp+yDRGlRYLZKMYIbk/AkVrWkIKqEK9ULi/vyLzev6dW0j0tv1KRF5w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMjl1xiS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B8E1F00893;
	Sun,  7 Jun 2026 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780833496;
	bh=wNB4h4utZuNVxiAEqzDEuzLMJdgTJVcCVWUJqa+wJiQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=QMjl1xiSwtKwrEq23rBPX3A0XsSxwc4cSJ5sHlFSziemnPv0qynpJ2Whc1E7Mx1cb
	 FxsV9O3WNpHYknPYNZSmK6eQt+nsBpaqZWwryUxSaTtObyTKtbqYDcPhfqz7M1nom+
	 MJsRUUCXBAzGqa4+CCmIE/jrnA+l6bfvRFsuAmQ8iXH7LNhMYFsA2KZzQpdwEmBNHj
	 FytGpxqTRDm81hZo2xT9cKp8gCMDbTXSDEYRpmaG3ZfsE0pIFQlbtmwHRDz6ackGzk
	 XJpuA5coF6Xqz5BJyYdhCoKs6qFL2SOjcmnQO4a30hUn+K+rxP+c00cQ/IbQpMlFZM
	 2p7T6LpAC+ykw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC v1 0/9] kho: granular compatibility and header decoupling
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, jasonmiu@google.com, 
 linux-kernel@vger.kernel.org, corbet@lwn.net, ran.xiaokai@zte.com.cn, 
 kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
In-Reply-To: <20260605033235.717351-1-pasha.tatashin@soleen.com>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
Date: Sun, 07 Jun 2026 14:58:08 +0300
Message-Id: <178083348872.1648214.17778188633648887952.b4-review@b4>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:linux-kselftest@vger.kernel.org,m:rppt@kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:jasonmiu@google.com,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:ran.xiaokai@zte.com.cn,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:graf@amazon.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91236-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,soleen.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F34B36507E0

On Fri, 05 Jun 2026 03:32:26 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

Hi,

> [...]
> data structure. Keeping all of this within the same `kexec_handover.c`
> file, and also under the same global version, is no longer sustainable.
> 
> To address this, this series:
> 1. Refactors and reorganizes the code by splitting out radix tree
>    and vmalloc into separate files.

I'd keep vmalloc where it is, it's more of a memory preservation primitive
rather than a data structure of it's own. The data structure it uses is an
implementation detail.

Let's minimize the churn where possible for the sake of git blame and
backports.

> 2. Moves and organizes internal and ABI headers into structured
>    directories under include/linux/kho/ and include/linux/kho/abi/.
>    Instead of cluttering include/linux/ with prefix-styled headers like
>    kho_block.h or kho_radix_tree.h, we use the already existing
>    include/linux/kho/ directory (e.g., kho/block.h and
>    kho/radix_tree.h).

This looks to me like unnecessary churn.
These all are bundled with KHO anyway, there is no header dependencies
that justify small headers for each two functions and netiher
linux/kexec_handover.h nor linux/kho/abi/kexec_handover.h are that long
to start splitting them.

> 3. Introduces a standard set of compatibility helpers in
>    kho/abi/compat.h.
> 4. Decouples the compatibility strings of individual KHO subsystems
>    (radix tree, vmalloc, and block) from the global KHO version.
>    This enables independent, granular compatibility versioning.

I agree that we should decouple versioning of these components from the
global KHO versioning.
Can't say I agree with the way you propose to do it.

I don't like that each user of a KHO component should include that
component version in its own version string (or whatever it may become
later).

It requires ABI headers update each time a user decides to add a new
data structure and worse when there is a change to that data structure.
It creates coupling of the data structure user with its particular
version and just looks ugly IMHO.

Suppose we added new fields to vmalloc, but made the implementation of
restore to be able to cope with both old and new versions. 
How this would be reflected in memfd versioning?
We'll add both versions of vmalloc to memfd version? And all other vmalloc
users?

Or, say, we add support to kmalloc() and use it in kho_block.
Then we'd have to add kmalloc() versioning to all kho_block users, right?

I think the versioning of each component should be handled by ->restore()
of that component. If it sees an incompatible version in the preserved
data, it returns an error. The versions can be stored e.g. in the base KHO
fdt.

> 5. Adds a KUnit test suite to verify that the composite compatibility
>    strings of different subsystems remain unique and sorted in
>    alphabetical order, guaranteeing a consistent and predictable
>    representation across configurations.

Without "composite compatibility strings" we don't need to care about
them "remaining unique and sorted in alphabetical order".

The need for this test alone is already a red flag ;-)

-- 
Sincerely yours,
Mike.


