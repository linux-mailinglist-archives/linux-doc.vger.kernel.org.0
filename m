Return-Path: <linux-doc+bounces-86005-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAs+FtOd+mk8QQMAu9opvQ
	(envelope-from <linux-doc+bounces-86005-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 03:48:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 574384D5696
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 03:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 41DAB301C016
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2026 01:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D21D248F72;
	Wed,  6 May 2026 01:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdyS+2DL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC81A3157;
	Wed,  6 May 2026 01:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778032075; cv=none; b=CimGDUQy6od52koCAlFtl/gbuuNhtbweXyrblAGY0CL11SDsZHCU1RNccLhKsBHgThO1KQr2RU9+Z6jTbFQMNPGfz0V2rJdTKndZCqZWFkvYi93cSVPqf8rbvo2QFBhXalsYET7ftKojvYQ0zx88fU71zOsyXLgMbCl/dXwTdv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778032075; c=relaxed/simple;
	bh=dq4n2rXi6bWQ/HXhC18pEK/hPmy2rLxTxVTfaCPfj8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWDSAjfWZjXUlvSi0vAnwOT3BX7+9N0Jw+nDExssk90iRzsuNrdW34fdE3zUCVCtV/SvRIb+kw1ZXj4OO2kTij392AGCcxW/7xL90NiDJPr5ghxKWYJyIuPkAy8nQMgj+abOHYx5kwicWRBS+WWg+IGlaTbPhs7WWDe+QuFF67Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdyS+2DL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE19C2BCB4;
	Wed,  6 May 2026 01:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778032074;
	bh=dq4n2rXi6bWQ/HXhC18pEK/hPmy2rLxTxVTfaCPfj8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YdyS+2DLodBz71jljKCplG4FZBljdfyl2Rw0roX/XQ85aOtU2I7CcqNF2A0kG5A//
	 NzyKhanO+oBs1GKJZ/+jVaIKfFY1ZBu5EXHaUhFVvqz6fwAGFvkin91L8ubjNXtnh7
	 o25ZvGb8CQLR9N4h85xEbobLDSeXWT/n1Q6fa988WYtAIuPdBY1VEZwO7nD4RnobgI
	 hyBa9xCzUrYXv2WXolzNYAFjhR6OgRye3m/99B2127B4m11IA4kwZI6hPk2QBxAwE3
	 wn65bgWJy/bPSIzurdvUiJVpeFoe6RVWkqcBEpBwZLwzQd1mqa4EEK201gJwibItot
	 gn/oAoZtWy6wQ==
Date: Tue, 5 May 2026 20:47:52 -0500
From: Rob Herring <robh@kernel.org>
To: Chen Wandun <chenwandun1@gmail.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, akpm@linux-foundation.org,
	bhe@redhat.com, rppt@kernel.org, pasha.tatashin@soleen.com,
	pratyush@kernel.org, ruirui.yang@linux.dev, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, saravanak@kernel.org,
	chenwandun@lixiang.com, zhaomeijing@lixiang.com, everyzhao@126.com
Subject: Re: [PATCH 01/11] of: reserved_mem: fix region count for nodes with
 multiple reg entries
Message-ID: <20260506014752.GA280279-robh@kernel.org>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-2-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065831.1510858-2-chenwandun@lixiang.com>
X-Rspamd-Queue-Id: 574384D5696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,lists.linux.dev,linux-foundation.org,redhat.com,kernel.org,soleen.com,linux.dev,lwn.net,linuxfoundation.org,arm.com,xen0n.name,dabbelt.com,eecs.berkeley.edu,lixiang.com,126.com];
	TAGGED_FROM(0.00)[bounces-86005-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 02:58:21PM +0800, Chen Wandun wrote:
> When a reserved-memory node contains multiple reg entries (e.g.,
> reg = <base1 size1>, <base2 size2>), the count used for
> total_reserved_mem_cnt is wrong in two places:
> 
> 1) __reserved_mem_reserve_reg() returns 0 on success regardless of how
>    many regions it reserved in memblock. The caller in
>    fdt_scan_reserved_mem() then increments count by just 1.

Just to make sure, more than 1 worked before the referenced commits? It 
would be easier to just define we only expect/support 1 entry.

> 
> 2) fdt_scan_reserved_mem_late() uses of_flat_dt_get_addr_size() which
>    only reads the first reg entry. Subsequent entries are never
>    initialized via fdt_init_reserved_mem_node(), so their metadata is
>    lost.
> 
> Fix both issues:
>  - Make __reserved_mem_reserve_reg() return the actual number of
>    regions successfully reserved. Update the caller to accumulate
>    the returned count.
>  - Rewrite fdt_scan_reserved_mem_late() to use
>    of_flat_dt_get_addr_size_prop() and iterate all reg entries,
>    initializing each one via fdt_init_reserved_mem_node().
> 
> Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")

