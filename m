Return-Path: <linux-doc+bounces-89684-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDMHDuY3FmqCjQcAu9opvQ
	(envelope-from <linux-doc+bounces-89684-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 02:16:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F85DDE79
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 02:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CD1C30118D8
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 00:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C89302742;
	Wed, 27 May 2026 00:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vGKfW3nP"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326CF8F4A;
	Wed, 27 May 2026 00:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779840990; cv=none; b=nOPFS8JXyB/ZVrO0vg7bSMOLGHH2+sct9gFV2zG5SIuDbYpCtcnZDsu0uY4Xp7n7iKOxON9HydJfD29ko76yo2Cs49nQWmvMfSaX5gpE4cBN73Ql8n7gxyGFHRcb1FRY787RSvK3q+wBu1CBc5fkyA8Kpg0bTP02F18pC758oHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779840990; c=relaxed/simple;
	bh=wnkKsU+u+788XORjEb0Dt7tHGir3ziOXFgN7E2/8xbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blgAtXW0D97IuX+WpcCCi9SPnVaNyufqBxjd1A++vscduwLY2ECr2apQqzFcpIuEuGcBYP2vGVriiYHbehdZmlLjkwfalHPT+GRxgEc4XW4ivA2lKAxhX5Z2m5SDQLYvGG4Cr2zKjDS7LfsEmhUFQtZLr9b3tkVwqV4N/GJUQ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vGKfW3nP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rGegtaSUwAxZyx7Dn39EFFabUoxoUYpovU8pmIaK834=; b=vGKfW3nP+Mh7edQDCNU+VruhZT
	67/iC07xVptkUYMHn8RWXIaxtbmEKGpMcvVtvvSsd8RxNEZ3j9v3q2VvO2WWKMSllUg+SUE6XqOe/
	Jhlj0zKeEvtdGEFO1AfN7lXFDPr4EKWR1av76trX3eB+/MHJd+WqAYgdETu6tLTbzjfMpkQ7kuGty
	UP7XhhD9Mn/MTOsjkbaBfZN8XXB4+tz63rvFxqhkmHitig5lu4+rFm4OX6+EQFSqepge6Z4NNXkiX
	O0f0niilD/pSOMldfrgMXESslAmVB03gbqkfp3W5lFNlJRioZD2icp6waHS8DvGjnuWId1Hp1vGSz
	5VOVsCuw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS1wW-0000000354z-2c4g;
	Wed, 27 May 2026 00:16:16 +0000
Message-ID: <3d1a68b0-93a4-408c-ad2d-a4556e2191f9@infradead.org>
Date: Tue, 26 May 2026 17:16:15 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mtd:spi-nor/next 20/28] htmldocs:
 Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends
 without a blank line; unexpected unindent. [docutils]
To: kernel test robot <lkp@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Pratyush Yadav <pratyush@kernel.org>,
 linux-doc@vger.kernel.org
References: <202605270105.CZQo8wSO-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202605270105.CZQo8wSO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89684-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: 346F85DDE79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 4:24 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
> head:   113ff79be3bcf0262eb7860d3325dd951ff29499
> commit: ecbba8d91f4bd0fccd722a7e5a57cec385c11ca8 [20/28] mtd: spi-nor: Add steps for testing locking support
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260527/202605270105.CZQo8wSO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605270105.CZQo8wSO-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 

>    Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentation. [docutils]
>>> Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]


I've already sent a patch for this.
https://lore.kernel.org/linux-doc/20260526172341.773398-1-rdunlap@infradead.org/T/#u


-- 
~Randy


