Return-Path: <linux-doc+bounces-55546-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 978DDB203C3
	for <lists+linux-doc@lfdr.de>; Mon, 11 Aug 2025 11:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D5A1890184
	for <lists+linux-doc@lfdr.de>; Mon, 11 Aug 2025 09:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A756B221F2F;
	Mon, 11 Aug 2025 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYnPvZKu"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B5F21B9DB
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 09:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904836; cv=none; b=eCe919gqwwM26hwtV7GY17IRhl3vpnaH9XY9oEM4yh5LF9p7nHn4lxLJ8QeuUwisaqDDmhcmExlu02jtUnLNZlJZrihnj8PZSMh8avKH9jFQnb0xcZ6joPHb6G9vrSqgMpYIobyqasiGl6MXI8vp68HAUjvBqqerQAwBepinEt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904836; c=relaxed/simple;
	bh=J1D/09r3N3DLDHsiA721RlvHu+0kUr0iq+BYE5etANU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzCOpTG+DqfO7wCA4n+meT8vmbE7brAQKnx/VTXdkgEDbbazKVbq5xiesnqOF9we7MQ3Pj/QVc1M/QgjRFiFmjv2XjUnpSMuIQNjSL2cml9m76JaCljaIRH2VJpA863eYdfm6aHfWpRYICe5ndkAyk+RIaiCciYk7xSGi1lkuF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=fail smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYnPvZKu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754904834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiJMfJlrRsamODe6gnkp4xuGLE6+B0lz0Dbma9PtWd8=;
	b=KYnPvZKuyfnjne5F9uCsPrsuKj4y3OfTVkqGUTVfywJGyU3Tqm3PLsIA9LhhCGSa5BmRPM
	6VzKtE4hBxao92n9l6/fDMwNA08evA2ZRqKytFDv+VfjDaxqF0R6dNc1qjcmeuwO7h9zta
	+a71n0tIVb/+K4UQfvVmtIWiir2Vr4Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-567-1rGCXW-fMce3E-ZR8gb95A-1; Mon,
 11 Aug 2025 05:33:50 -0400
X-MC-Unique: 1rGCXW-fMce3E-ZR8gb95A-1
X-Mimecast-MFC-AGG-ID: 1rGCXW-fMce3E-ZR8gb95A_1754904826
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE1DE1800352;
	Mon, 11 Aug 2025 09:33:43 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.234])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 9F6FA19560AD;
	Mon, 11 Aug 2025 09:33:29 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 11 Aug 2025 11:32:31 +0200 (CEST)
Date: Mon, 11 Aug 2025 11:32:16 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	len brown <len.brown@intel.com>, pavel machek <pavel@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nico Pache <npache@redhat.com>, xu xin <xu.xin16@zte.com.cn>,
	wangfushuai <wangfushuai@baidu.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jeff Layton <jlayton@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Adrian Ratiu <adrian.ratiu@collabora.com>, linux-pm@vger.kernel.org,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 5/9] freezer: set default freeze priority for
 PF_SUSPEND_TASK processes
Message-ID: <20250811093216.GB11928@redhat.com>
References: <20250807121418.139765-1-zhangzihuan@kylinos.cn>
 <20250807121418.139765-6-zhangzihuan@kylinos.cn>
 <20250808143943.GB21685@redhat.com>
 <0754e3e3-9c47-47d5-81d9-4574e5b413bc@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0754e3e3-9c47-47d5-81d9-4574e5b413bc@kylinos.cn>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 08/11, Zihuan Zhang wrote:
> 
> 在 2025/8/8 22:39, Oleg Nesterov 写道:
> >On 08/07, Zihuan Zhang wrote:
> >>--- a/kernel/power/process.c
> >>+++ b/kernel/power/process.c
> >>@@ -147,6 +147,7 @@ int freeze_processes(void)
> >>
> >>  	pm_wakeup_clear(0);
> >>  	pm_freezing = true;
> >>+	freeze_set_default_priority(current, FREEZE_PRIORITY_NEVER);
> >But why?
> >
> >Again, freeze_task() will return false anyway, this process is
> >PF_SUSPEND_TASK.
>
> I  think there is resaon put it here. For example, systemd-sleep is a
> user-space process that executes the suspend flow.
>
>  If we don’t set its freeze priority explicitly, our current code may end up
> with this user process being the last one that cannot freeze.

How so? sorry I don't follow.

Oleg.


