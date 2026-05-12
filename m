Return-Path: <linux-doc+bounces-87142-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO49BrM/A2ro2AEAu9opvQ
	(envelope-from <linux-doc+bounces-87142-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:56:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6746523157
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19401303EACE
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 14:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16A836A36D;
	Tue, 12 May 2026 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEm1PC8N"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C6836A004;
	Tue, 12 May 2026 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597799; cv=none; b=FjFrr0sBbVXsec7Arz77dbnAxTOysUf89bhuOT7xQKk4SmOPNzHrTt5Upo8VJuoJwGzwAzcU346s+dRQfbP6W1nST1ELMRV7VIr9LjOrYdlC3LCn7CeKwmPCUK6jE8O/Lz8yhsVrYdJgoKdvFCQ+LjHaXN5PrFFKAZSS9Kqnedg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597799; c=relaxed/simple;
	bh=wuIBR3A+oOyuFFHjM9xctUbLZi3KNYapx+NnPKUX06E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVXvnYcmq9/q2MST3TIDFoJsWBCdOZDcUpF5bo8jYS7nBulTttsQRjoXOokNfRzs6deWFHu6kyP+2j1QUgbd6hghRLI4QICcmknkhZRsmQVMgHSxu4wOQAu56welCOmPvu3ztrhDj/Psh22my27ZxhiBSlTawtbhs33XVdWh/gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEm1PC8N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB1FC2BCB0;
	Tue, 12 May 2026 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778597799;
	bh=wuIBR3A+oOyuFFHjM9xctUbLZi3KNYapx+NnPKUX06E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BEm1PC8NgvdubfFZsmvzbtBHrUxK5FWtm1kXFWkBXm/MyrC6Pg16SUpA8fz309Ned
	 qXp6Ms/QXaKFWv3afgi32CiFPsfMeRaOML/aWXptV33HSrQALYj4E8bGZrsIE90MJs
	 c/d65mx0HdpvU7E9NbELckGkei5JlVZP9pHvkCsvicyLpvwoJiu53og3h34mvMii6A
	 Rz2ey3LOyd/q7gD6PVMvzge6PJsVYqdlC7xryhGiJfp35VEiobyqFcJfP1vZF/L5zU
	 sBbEVAYgKVqBtvcpZCowxENMdANDaVM3IUuaKXHs4HP3v3WYLDNi4oVb69blvkH5kx
	 bkiWeFy2AoCPA==
Date: Tue, 12 May 2026 07:56:38 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [kees:for-next/hardening 1/1] htmldocs:
 Documentation/driver-api/basics:127: ./include/linux/stddef.h:110: WARNING:
 Definition list ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202605120755.4A2AC441EB@keescook>
References: <202605120507.9iQRMgKR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605120507.9iQRMgKR-lkp@intel.com>
X-Rspamd-Queue-Id: D6746523157
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87142-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,01.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 05:06:30AM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
> head:   3c74955937520e6aabc0ec921b1bfe01734c6abc
> commit: 3c74955937520e6aabc0ec921b1bfe01734c6abc [1/1] stddef: Document designated initializer semantics for __TRAILING_OVERLAP()
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260512/202605120507.9iQRMgKR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605120507.9iQRMgKR-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    --------------------------------------------------------------------------------------------^
>    Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
>    Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
>    Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
>    Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
> >> Documentation/driver-api/basics:127: ./include/linux/stddef.h:110: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:115: ERROR: Unexpected indentation. [docutils]
> >> Documentation/driver-api/basics:127: ./include/linux/stddef.h:116: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:117: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:122: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:124: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:139: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:140: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]

Oh, hrm, there are a lot of errors in stddef.h for the "htmldocs" make
target. Gustavo, can you see what's needed to fix these?

-Kees

-- 
Kees Cook

