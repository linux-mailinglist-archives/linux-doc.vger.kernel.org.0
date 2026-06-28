Return-Path: <linux-doc+bounces-93847-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fW8TO81FQWovnAkAu9opvQ
	(envelope-from <linux-doc+bounces-93847-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 28 Jun 2026 18:03:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FECD6D4552
	for <lists+linux-doc@lfdr.de>; Sun, 28 Jun 2026 18:03:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=j4Ylx3G9;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93847-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93847-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBFAD300EAAB
	for <lists+linux-doc@lfdr.de>; Sun, 28 Jun 2026 16:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B7F3A6F1B;
	Sun, 28 Jun 2026 16:03:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7366D190462;
	Sun, 28 Jun 2026 16:03:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782662600; cv=none; b=kJMGptrOMF3k2U1IlEjTBiwOwEqztKVZztXKEFQ6M6WRsId7bLuHz65LwWUWtai6npp6CWBXXMXkxwIf5XIVXdimwoJ7Jddpz0airsJH7/cV5DD1RxfaoY7ZO2sQ/8Us/+MTn613Tv6U8h8wRoMtK3AYRy2kjI0jabe62Aup7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782662600; c=relaxed/simple;
	bh=Bg7ATLfq06nhMAvgzIEIchQ4wjP8NHZa4leLVfF2GrI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aHgmSZ7khvqrPeeY1ejrlTrO+K+dZWKJWJONzqFGpZakNTbpqW30OUL7m1DCvCT6NO/SwTBpJpFLmXjuqFv01x3GuijWVibA6uGgLSlrDi+HwQac+GWpGRKOo/4KTqExN4wvWkhHmznmfjBuFodeMmbWAuNiPjhTHhC31i8phEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4Ylx3G9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69A51F000E9;
	Sun, 28 Jun 2026 16:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782662599;
	bh=vStoMMAuf3Habph9ryA7GqWRgnEHB2CaISdV5isqMNQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j4Ylx3G9Q7SS5Lo1fqaA+jDwdjRMFYrQTd9Kuh7kGwIHAMqfyX8F6MY2zh6BraVKm
	 ReOTxCEb2MsClBG+hNJrUCN/O7v6WhzINBLDw4+gTsqZTrLnjtWbTcxpsi5PZXZJtS
	 h8K56Fq/ba7ZUOIz3xwrLim7O0hvzmE35KwM26ckmJexw/UWYMgSkDMAeJ7nF1Lp8y
	 y7PM+Xyxr3TO9VMInnWX4TAgEnXnUAlWNPHF2EKCkLniDWyX0KUqQKnFhitsXjh4Pq
	 TXdQ9VoRul47oVODsgA6Lw10FW0QsZW1nipnZbzSr6UgNVBOzow8QKJR7aSisu3R+F
	 EP2/QC0xrIBdQ==
Date: Mon, 29 Jun 2026 01:03:14 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 11/11] tracing/probes: Add a new testcase for BTF
 typecasts
Message-Id: <20260629010314.0c6563c5022c1c973788464d@kernel.org>
In-Reply-To: <178248336390.841606.1695444929833877704.stgit@devnote2>
References: <178248325671.841606.17344906774310339507.stgit@devnote2>
	<178248336390.841606.1695444929833877704.stgit@devnote2>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93847-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 3FECD6D4552

This has a problem and needs some updates.

On Fri, 26 Jun 2026 23:16:04 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/btf_probe_event.tc b/tools/testing/selftests/ftrace/test.d/dynevent/btf_probe_event.tc
> new file mode 100644
> index 000000000000..96791e120b7d
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/dynevent/btf_probe_event.tc
> @@ -0,0 +1,51 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: BTF event with typecast and percpu access
> +# requires: dynamic_events "this_cpu_read(<fetcharg>)":README "[(structname[,field])]<argname>[->field[->field|.field...]]":README
> +
> +# Check if the sample module is loaded
> +if ! lsmod | grep -q trace_events_sample; then
> +  modprobe trace-events-sample || exit_unsupported

I think this should be exit_unresolved.

> +fi
[...]
> diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/btf_typecast_accepted.tc b/tools/testing/selftests/ftrace/test.d/dynevent/btf_typecast_accepted.tc
> new file mode 100644
> index 000000000000..acf0b5a917d3
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/dynevent/btf_typecast_accepted.tc
> @@ -0,0 +1,107 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: BTF typecast and percpu access syntax validation
> +# requires: dynamic_events "this_cpu_read(<fetcharg>)":README "[(structname[,field])]<argname>[->field[->field|.field...]]":README
> +
> +KPROBES=
> +FPROBES=
> +
> +if grep -qF "p[:[<group>/][<event>]] <place> [<args>]" README ; then
> +  KPROBES=yes
> +fi
> +if grep -qF "f[:[<group>/][<event>]] <func-name>[%return] [<args>]" README ; then
> +  FPROBES=yes
> +fi
> +
> +if [ -z "$KPROBES" -a -z "$FPROBES" ] ; then
> +  exit_unsupported
> +fi
> +
> +echo 0 > events/enable
> +echo > dynamic_events
> +
> +# Load trace-events-sample module if available to have per-CPU counter structure defined
> +if ! lsmod | grep -q trace_events_sample; then
> +  modprobe trace-events-sample || true

I think this must be tested, and if the module is not found,
the test must return UNRESOLVED error.

> +fi
[...]
> diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/eprobes_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/dynevent/eprobes_syntax_errors.tc
> index 0e65e787e426..1d6d1cf94f16 100644
> --- a/tools/testing/selftests/ftrace/test.d/dynevent/eprobes_syntax_errors.tc
> +++ b/tools/testing/selftests/ftrace/test.d/dynevent/eprobes_syntax_errors.tc
> @@ -21,8 +21,17 @@ check_error 'e:foo/^bar.1 syscalls/sys_enter_openat'	# BAD_EVENT_NAME
>  
>  check_error 'e:foo/bar syscalls/sys_enter_openat arg=^$foo'	# BAD_ATTACH_ARG
>  
> +check_error 'e:foo/bar syscalls/sys_enter_openat arg=^COMM'	# NO_EVENT_FIELD
> +if grep -q '\\$current' README; then

Sashiko found a problem here. Indeed. this is wrong. See below:

> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/uprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/kprobe/uprobe_syntax_errors.tc
> index c817158b99db..e12dc967ec76 100644
> --- a/tools/testing/selftests/ftrace/test.d/kprobe/uprobe_syntax_errors.tc
> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/uprobe_syntax_errors.tc
> @@ -28,4 +28,9 @@ if grep -q ".*symstr.*" README; then
>  check_error 'p /bin/sh:10 $stack0:^symstr'	# BAD_TYPE
>  fi
>  
> +# $current is not supported by uprobe
> +if grep -q "\$current.*" README; then

This is correct check.

Let me fix those.

Thanks,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

