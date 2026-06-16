Return-Path: <linux-doc+bounces-92454-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PxbiH6+jMGolVwUAu9opvQ
	(envelope-from <linux-doc+bounces-92454-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 03:15:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E3C68B325
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 03:15:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OqdXuC1d;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92454-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92454-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56349302EEBC
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 01:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF12E33F383;
	Tue, 16 Jun 2026 01:15:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04C733AD9B;
	Tue, 16 Jun 2026 01:15:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781572523; cv=none; b=Ao7J3kvpApgu6ZF7AvSvk4xPReg+v+Ik74flZBibNTkx8dbdmQnTIb78s3zyhnGBARY6z2ldwwcYRD1HF9ACsIbyrcPYMFRPTEfNwuuMl+eXZ7S3ezsyow03gDw9yZQMctTYRdQ/UMUR/knGLmSgHBVo3SYXqZ8seD+z4jGZaBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781572523; c=relaxed/simple;
	bh=n+HgkcKRqSR/TDoR2qCULFHNYu47wmD5t1x0bjlCi04=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nBHwJpAlRbQz684K0e65X+o04R5S7GIDcXTyXEq+TmGdqHC5V8+LxsUq70Fc9OwXFJ8xLvc6UjoWeUd3LhLhShCK9RKQzv+N/RiXK9+Fb71wjw7QHRiJcApdCZF4HAH0oCe/4W+LECdacxyz3Hp4WDRs6MNinGNBcZaHy6rtBZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqdXuC1d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3191F000E9;
	Tue, 16 Jun 2026 01:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781572522;
	bh=GJEPYwfhOR8QzZX+HHyPEWvX+nK3bmcjPuI6opafco4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OqdXuC1dupVyt3MP7yoE7+t4yFMuiBEj7Vb5NGaRFzOg0J6dZNpFeg/l07Q3Atg0P
	 yGiTvSmm5GAxZVWRzCqGqS/6pPHMIPrQl6oLbp1PfK/mUaqrVUc1w5uWWT3GQbWaKw
	 dqnw6qsUgo7OC7LAtjEu/cHBNcHFNHOzIcXiexB+NRanH5Xm2ntRE6DrFQn6e+oy79
	 WP+bg0nbXkPRMowKCS4ar2soY+OoUigl0FFNHs8F6m36v76V8Sgs8qCn0qcFcjqJwu
	 61I82oyayTzUHaStIyV4i3mKFjXP1/kSW1vP0nLXL8u3NysPp9GbePAKwLgJJ9Xqiq
	 GJJ6NSfD/oBOA==
Date: Tue, 16 Jun 2026 10:15:18 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 6/7] tracing/probes: Add this_cpu_read() and
 this_cpu_ptr() dereference method to fetcharg
Message-Id: <20260616101518.798465295df36bec64f0f279@kernel.org>
In-Reply-To: <178148609402.185520.8189233495763938815.stgit@devnote2>
References: <178148603548.185520.3389196102475741865.stgit@devnote2>
	<178148609402.185520.8189233495763938815.stgit@devnote2>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92454-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1E3C68B325

On Mon, 15 Jun 2026 10:14:54 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> +		case FETCH_OP_DEREF_CPU:
> +			val = (unsigned long)this_cpu_ptr((void __percpu *)val);
> +			ret = probe_mem_read(&val, (void *)val, sizeof(val));
> +			break;
> +		case FETCH_OP_CPU_PTR:
> +			val = (unsigned long)this_cpu_ptr((void __percpu *)val);
> +			ret = 0;
> +			break;

Hmm, maybe I can just convert the FETCH_OP_DEREF_CPU to
FETCH_OP_CPU_PTR + FETCH_OP_DEREF to simply the code.

> +		default:
> +			lval = llval;
> +			goto out;
> +		}
>  		if (ret)
>  			return ret;
> +		llval = lval;
>  		code++;
>  	} while (1);
> +out:
>  
>  	s3 = code;
>  stage3:
> @@ -181,6 +195,10 @@ process_fetch_insn_bottom(struct fetch_insn *code, unsigned long val,
>  	case FETCH_OP_ST_UMEM:
>  		probe_mem_read_user(dest, (void *)val + code->offset, code->size);
>  		break;
> +	case FETCH_OP_ST_CPUMEM:
> +		val = (unsigned long)this_cpu_ptr((void __percpu *)val);
> +		probe_mem_read(dest, (void *)val, code->size);
> +		break;

Then, I can just drop this change.

Thanks,


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

