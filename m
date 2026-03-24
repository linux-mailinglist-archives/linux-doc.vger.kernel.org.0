Return-Path: <linux-doc+bounces-80866-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADZnF1zxwWkgYAQAu9opvQ
	(envelope-from <linux-doc+bounces-80866-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 03:05:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A6300EAE
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 03:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1E3F300C6EE
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 01:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E9237C103;
	Tue, 24 Mar 2026 01:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUfqQ+U+"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C490934DB6B;
	Tue, 24 Mar 2026 01:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317556; cv=none; b=W4DpeG0x3qnakYeigA/QjQe6jN/uZz8Q+zVR/P0pfRW4NKRyFaLFa+NrLRo51aUWRakAFiAtp9KsN60v5xsxnRy5DUDI+BgnBYaGygV9eQAs03D8tHylaCSOZwb8Qj/lxknukRfJsVLjdLz1KELqYKconPJb1JKbxCToZsM4rsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317556; c=relaxed/simple;
	bh=PccirS4JhA9bCP6y7wgabbI+7yDxHnCsp1XLhQsjskI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UAdhGNZ4AW6I94h5DDJePUgxvQO2uzGUWOfkxlN62FwVZDSARYzs92W59DX52fN1y78WfiY2+M4yTwe7AyE3E6zJeT9DrRFJQP0v8/aYLO6w1XsuMfBjzd8FzDm03bs6pOvvnuBFziHsOdfhDMdACZtRpoUtP/bi3/L35CMMrRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUfqQ+U+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1877AC2BCB1;
	Tue, 24 Mar 2026 01:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774317556;
	bh=PccirS4JhA9bCP6y7wgabbI+7yDxHnCsp1XLhQsjskI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IUfqQ+U+ZE0GXNjv2mDtMdFAD2z8ZA9O0SUsNNR0X3WRGGJ/vUlq519nNCba7cZgc
	 whmRXNJPEfACtppszNGE86/Zjjf1Aaz1u2I5VdDbzKeSGZ+YC+sLjv2ZKYDp8uzoJ1
	 wKL3ym1sBvZ0O3FrLsAmNllh+rULdBwM4EW4ppItNKWzMepiQJrxffyy0mbc5jodn3
	 rAUEBUIkny+HuGKnAZwoQi8Fiv0hAxPLFIdUgyWLvBsFv8us9n/gtMLHwJC7PvXwjN
	 5xTGuH1uNaDEAYPWaEFfGjQ/F9KK/QUgd3/5d81juu0vnnNTHqMLFXzBNEB/HoHoBM
	 w2/HLJQVcHjMw==
Date: Tue, 24 Mar 2026 10:59:13 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
Cc: rostedt@goodmis.org, corbet@lwn.net, shuah@kernel.org,
 mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 2/4] fprobe: Support comma-separated filters in
 register_fprobe()
Message-Id: <20260324105913.cf60a2f2fcc64afbe30bd22e@kernel.org>
In-Reply-To: <20260205135842.20517-3-seokwoo.chung130@gmail.com>
References: <20260205135842.20517-1-seokwoo.chung130@gmail.com>
	<20260205135842.20517-3-seokwoo.chung130@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-80866-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 655A6300EAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu,  5 Feb 2026 08:58:40 -0500
"Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com> wrote:

> register_fprobe() passes its filter and notfilter strings directly to
> glob_match(), which only understands shell-style globs (*, ?, [...]).
> Comma-separated symbol lists such as "vfs_read,vfs_open" never match
> any symbol because no kernel symbol contains a comma.
> 
> Add glob_match_comma_list() that splits the filter on commas and
> checks each entry individually with glob_match().  The existing
> single-pattern fast path is preserved (no commas means the loop
> executes exactly once).
> 
> This is required by the comma-separated fprobe list syntax introduced
> in the preceding patch; without it, enabling a list-mode fprobe event
> fails with "Could not enable event".

OK, in this case, you should reorder patch this as the first one.
Please make this [1/4] and remove this requirement explanation paragraph.
The patch itself looks good to me.

Thank you,

> 
> Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
> ---
>  kernel/trace/fprobe.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
> index 1188eefef07c..2acd24b80d04 100644
> --- a/kernel/trace/fprobe.c
> +++ b/kernel/trace/fprobe.c
> @@ -672,12 +672,38 @@ struct filter_match_data {
>  	struct module **mods;
>  };
>  
> +/*
> + * Check if @name matches any comma-separated glob pattern in @list.
> + * If @list contains no commas, this is equivalent to glob_match().
> + */
> +static bool glob_match_comma_list(const char *list, const char *name)
> +{
> +	const char *cur = list;
> +
> +	while (*cur) {
> +		const char *sep = strchr(cur, ',');
> +		int len = sep ? sep - cur : strlen(cur);
> +		char pat[KSYM_NAME_LEN];
> +
> +		if (len > 0 && len < KSYM_NAME_LEN) {
> +			memcpy(pat, cur, len);
> +			pat[len] = '\0';
> +			if (glob_match(pat, name))
> +				return true;
> +		}
> +		if (!sep)
> +			break;
> +		cur = sep + 1;
> +	}
> +	return false;
> +}
> +
>  static int filter_match_callback(void *data, const char *name, unsigned long addr)
>  {
>  	struct filter_match_data *match = data;
>  
> -	if (!glob_match(match->filter, name) ||
> -	    (match->notfilter && glob_match(match->notfilter, name)))
> +	if (!glob_match_comma_list(match->filter, name) ||
> +	    (match->notfilter && glob_match_comma_list(match->notfilter, name)))
>  		return 0;
>  
>  	if (!ftrace_location(addr))
> -- 
> 2.43.0
> 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

