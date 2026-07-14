Return-Path: <linux-doc+bounces-96839-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bBUuKMKtVmo5AAEAu9opvQ
	(envelope-from <linux-doc+bounces-96839-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 23:44:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CBD75908B
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 23:44:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=FujvXYl1;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96839-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96839-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6F93301DDB1
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 21:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC30F41E6BE;
	Tue, 14 Jul 2026 21:44:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D0A41C2FE;
	Tue, 14 Jul 2026 21:44:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784065471; cv=none; b=idy1/ZU5zQ82tm+NGzfLWpUumCC+vMfwbsNQDPetERfK9Vnb0OG5rFh5vaSYuGGcMVzQzItAk1QXcPt0s96IZE2lgSOVFjShtW+X7uBBS4G0pUSW+RPVpGgBswUHz3UMGUMDeLVqm7T0rlMGsSvamJ3orRq/0CRsasE9TaUUqjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784065471; c=relaxed/simple;
	bh=oaYKfrA3fqzJEJsJQy74jqlcEuNAnCjiwvKjl064mDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paPUgyx/tiWuufM49YBbfNUe7s7ZpaBnqMWJwUR6sE4QNa7jxbjPUpwz3oU/XDgG9yTXoq0aYkzNCZrsIQus3oaXWhEE/XlZ7kbuWzxG+gjpeRAsjL7PbTKErEj+GBw70qA7T4kMlgeUXnGAu57y0DmVMQbGtHLriVXKvOYSJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FujvXYl1; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LmUED+JhE6GfXFjui0hCexz1XM2vfWKgWmuWmEOwuXM=; b=FujvXYl1jW/UqNjl/J3nIITNtm
	ICw1EG0z7w616Ld86IXtDzyQ+JeFu+z/ttRliVmMzFxflbiUANLUGyOU+RTLuBxZ/UPKD11tXBUAC
	/dKsFSXfGVUxVYhXvgDzPhR8PobM/BFHxnHaYJKp6/rUBR/4oiOM3CsNASqDtfTwOEhrQjiC7f32r
	QAQJN5AO1e+EX0XAykM5xC8Rx2n1VoeAszLXv40vVIyFiVALAVYWrewmwdisaaHkJicSXmchNnWuB
	2IU4g01u57uryxCRrpfvIRTmtXkC/Wq9ThI0ULM1n6IxixpLFtFJYSqk/V6UVd2ejGgQhBiMdFNxC
	vusN4BFA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkvP-0000000DMsn-2OCO;
	Tue, 14 Jul 2026 21:44:23 +0000
Message-ID: <12d74842-c826-46ec-922a-68f5e4042cb6@infradead.org>
Date: Tue, 14 Jul 2026 14:44:23 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/kernel-doc: Suggest possible names for excess
 descriptions
To: Ryszard Knop <ryszard.knop@intel.com>, linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
References: <20260714111208.323108-1-ryszard.knop@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260714111208.323108-1-ryszard.knop@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ryszard.knop@intel.com,m:linux-doc@vger.kernel.org,m:shuicheng.lin@intel.com,m:jani.nikula@linux.intel.com,m:linux-kernel@vger.kernel.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-96839-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05CBD75908B

Hi,


On 7/14/26 4:12 AM, Ryszard Knop wrote:
> Since check_sections() now warns if a documentation tag member name is
> the same as defined in the struct, we can suggest names the checker
> knows, so that it's more obvious how to deal with the warning.
> 

Seems to work for me.

> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 2dedda215c22..3f88095eab06 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -558,6 +558,13 @@ class KernelDoc:
>                          self.push_parameter(ln, decl_type, param, dtype,
>                                              arg, declaration_name)
>  
> +    def get_suggestions_hint(self, decl_name, possible_names):
> +        suggestions = set(name for name in possible_names if decl_name in name)
> +        if not suggestions:
> +            return ""
> +
> +        return f"(did you mean one of: '{"', '".join(suggestions)}')"
> +
>      def check_sections(self, ln, decl_name, decl_type):
>          """
>          Check for errors inside sections, emitting warnings if not found
> @@ -566,12 +573,13 @@ class KernelDoc:
>          for section in self.entry.sections:
>              if section not in self.entry.parameterlist and \
>                 not known_sections.search(section):
> +                hint = self.get_suggestions_hint(section, self.entry.parameterlist)
>                  if decl_type == 'function':
>                      dname = f"{decl_type} parameter"
>                  else:
>                      dname = f"{decl_type} member"
>                  self.emit_msg(ln,
> -                              f"Excess {dname} '{section}' description in '{decl_name}'")
> +                              f"Excess {dname} '{section}' description in '{decl_name}' {hint}")

When 'hint' is empty, this statement and/or the similar one below
adds a trailing space to each of those lines.
Can you prevent that?  (yeah, it's just a nit)

>  
>          #
>          # Check that documented parameter names (from doc comments, including
> @@ -591,12 +599,13 @@ class KernelDoc:
>              if param_name in self.entry.parameterlist:
>                  continue
>  
> +            hint = self.get_suggestions_hint(param_name, self.entry.parameterlist)
>              if decl_type == 'function':
>                  dname = f"{decl_type} parameter"
>              else:
>                  dname = f"{decl_type} member"
>              self.emit_msg(ln,
> -                          f"Excess {dname} '{param_name}' description in '{decl_name}'")
> +                          f"Excess {dname} '{param_name}' description in '{decl_name}' {hint}")
>  
>      def check_return_section(self, ln, declaration_name, return_type):
>          """

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy

