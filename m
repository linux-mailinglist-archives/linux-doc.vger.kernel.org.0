Return-Path: <linux-doc+bounces-86078-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOP/JjZX+2n+ZQMAu9opvQ
	(envelope-from <linux-doc+bounces-86078-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 16:59:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E99D4DCC37
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 16:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18005309CFED
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2026 14:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D41480355;
	Wed,  6 May 2026 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asJ2zJX1"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2CF48033F;
	Wed,  6 May 2026 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078745; cv=none; b=ghX7uln6OKOGnf6hylB+kMo9irVnR+HpwVpGwNuAtdYNlQcRIEv2ccw8TgpTVOJkTCMnelEC8JRyxhoVCnqBscHiOTQmB5s+GZoQ/w9ScuDWrktRfDPsenkwrGboHk8CTFqRtILqobxWy3yYvtHChCks8KKwSfeMahNq3VQt5v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078745; c=relaxed/simple;
	bh=0KO8hApD0eGU7/dmfhl80Uq28cv6QcKZtN0DhSa6VO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqmgmYJw1VH95uFOu/ekxDYwVVPixzb+chbz1CJluleazdlHiKkf0+imON4Kh1E4ZZx6QKoaLfrq43HIXvjapU2ULqmNXwaOq8uUmZnnpfB+jU0FLYoNLdlt1WfS4nZ2vsOn5kIXQyAWaSetwVBxYtq8Gny0yTK8bhR/Y3cfaA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asJ2zJX1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C551CC2BCB0;
	Wed,  6 May 2026 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778078745;
	bh=0KO8hApD0eGU7/dmfhl80Uq28cv6QcKZtN0DhSa6VO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asJ2zJX1kDJF4N0879YgzX1aEN+OycWFuFs84uFQjFbe8XLl2JHLjmVHMoHBwAk6J
	 EyTzWttjeZ93aH8W7WcFdePxJWrsBw+70Fkp1Sj/wAXvJJ9ZUP0h6gsAQLVvDjqXg+
	 1JmbHeC6lmnatopx+tcxUwuh3OWiIVIg9v7sbG4queTxnNERHgV5fuJoHciimhrIva
	 z6tiru0U8Vxnzc3gPBEsx2ByvC9Goicr/7n+uezz8eLpotdhh9lgEl05dnGU8nYkxS
	 OEKJJCfqVKkDK1W7iVncEPYYt+PI8inusarD9Il7nm3cTLeZ9yidzQoX4xCLwhJW5m
	 DVbx5oZerq5OA==
Date: Wed, 6 May 2026 09:45:42 -0500
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
Subject: Re: [PATCH 05/11] of: reserved_mem: add linux,no-dump property
 support for reserved memory regions
Message-ID: <20260506144542.GA2072596-robh@kernel.org>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-6-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065831.1510858-6-chenwandun@lixiang.com>
X-Rspamd-Queue-Id: 9E99D4DCC37
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
	TAGGED_FROM(0.00)[bounces-86078-lists,linux-doc=lfdr.de];
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

On Wed, Apr 29, 2026 at 02:58:25PM +0800, Chen Wandun wrote:
> Add a 'no_dump' field to struct reserved_mem and parse the
> 'linux,no-dump' device tree property during reserved memory node
> initialization. This property allows device tree authors to mark
> specific reserved memory regions that should be excluded from kdump
> vmcore dumps.
> 
> Reserved memory regions used by device firmware (e.g., GPU, DSP, modem)
> typically contain data that is not useful for kernel crash analysis and
> can significantly increase vmcore size. The 'linux,no-dump' property
> provides a declarative way to indicate these regions should be filtered
> out when constructing the elfcorehdr for kdump.
> 
> The property is named with a 'linux,' prefix because kdump/vmcore is
> Linux-specific and the property is an OS hint rather than a hardware
> description, matching existing properties such as 'linux,cma-default'
> and 'linux,usable-memory-range'.
> 
> The 'linux,no-dump' property is only effective when the region:
>  - Does not have 'no-map': these regions are already excluded from
>    vmcore since they are removed from the linear mapping (MEMBLOCK_NOMAP).
>  - Does not have 'reusable': CMA reusable regions are actively used by
>    the kernel for movable page allocations, and their contents are
>    valuable for crash analysis.
> 
> The no-dump status is also printed in the boot log alongside the
> existing nomap and reusable flags for diagnostic purposes.

I think this property is the wrong way around and probably not needed. 
The default should be exclude the regions, but if Linux is using the 
regions (like CMA) then it can decide on its own to include them.

With the restructuring that went into 7.1, it should be possible for the 
CMA code (and code for any other regions) to set some flag for the 
region.

Rob

