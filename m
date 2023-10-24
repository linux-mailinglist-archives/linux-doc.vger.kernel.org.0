Return-Path: <linux-doc+bounces-890-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF17D462A
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 05:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2858D1C20847
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 03:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1198979D6;
	Tue, 24 Oct 2023 03:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="KAxMdUtD"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC6E7496
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 03:52:29 +0000 (UTC)
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5DCD79
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:24 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-66cfef11a25so22055246d6.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698119544; x=1698724344; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJ6cgsoW7aQH5On83YMhoiBwYYPuRYMOz8kgYTAfm70=;
        b=KAxMdUtDsdeg4dkTHCiRKRx2qzgP3I/YsfQWQAttZhThMMFHTachz+vuIDPFno0suJ
         cwCLtf0I2mh8lOvKs71uzJNM+UqepOh2T1+r/742NcxJSpobudmr+kgmqF/sBTNbUpKv
         FQAt2TGnMkJf3NGG5qHPee35ccZAwu8W/CS/pf2r/Jmnikc+QCq3ryUq9Ea9YBXLZZg2
         lDo1fD7Tw4iV+XkbNYf9fj94VnCiNzMrlda2NMe7SY0HiT6fYAsNv47FuS48fdZQzIpy
         b5/TFB9Bsb1i6bGqfamWvXBThuTL0zClgBvKM/xReZdP4+8IIw5XqYWtn2rUrwHSwDME
         2P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698119544; x=1698724344;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJ6cgsoW7aQH5On83YMhoiBwYYPuRYMOz8kgYTAfm70=;
        b=QjL7rmCf3snDYhawuxNGA3CtoBB+PnxvaFwDtBAf4NElxkp6x9HToz5nyt6ENgbFCW
         xkd1rMhCFwQt+zYH7UlCAky5pWLjRz63Gp0qWLWCZbCZXhWFYt/KdaxJ2YI7R5/jxVPc
         SKahsy6/CmDS+wPlkj2NTD5uSR8AgI97Qz90XpoFN19Viu6ef6es+zcBTSt3S7f9lEG3
         42f37EK6qMD9Bf0RLNsTEjMQPT0SwjQCC17dzSmWpdza42TfXtn6TFLt0LRWRRJgR8qS
         VrYxbZy/fr0Btn61bSpv2+61k7uNbvt+PUqw27J5ygQ4xSiqnF4Ci8HbogCA3a+VHwQQ
         VpHw==
X-Gm-Message-State: AOJu0YwYf1RlpOIjQDsO6/ofD2uL+xcafTAUsincN2/DKWTamLoZ3YaQ
	ECd4JZlBSU+4KHYmBvMC3ACV
X-Google-Smtp-Source: AGHT+IEGJExcEmKWOA+GK4RiJy1dG9NUrijjKZKzwgQx3WaST0PHhoK9sXJHymPxgN5Fyv3kt+Yfmg==
X-Received: by 2002:ad4:5cc2:0:b0:66d:169a:d41c with SMTP id iu2-20020ad45cc2000000b0066d169ad41cmr11857101qvb.19.1698119543857;
        Mon, 23 Oct 2023 20:52:23 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id i7-20020a37c207000000b0076db5b792basm3162304qkm.75.2023.10.23.20.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 20:52:23 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:52:22 -0400
Message-ID: <aa226bdcba26d74304f6c10c290db840.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com, audit@vger.kernel.org, roberto.sassu@huawei.com, linux-kernel@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>, Fan Wu <wufan@linux.microsoft.com>
Subject: Re: [PATCH RFC v11 3/19] ipe: add evaluation loop
References: <1696457386-3010-4-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1696457386-3010-4-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
> 
> IPE must have a centralized function to evaluate incoming callers
> against IPE's policy. This iteration of the policy for against the rules
> for that specific caller is known as the evaluation loop.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> ---
> v2:
> + Split evaluation loop, access control hooks, and evaluation loop from policy parser and userspace interface to pass mailing list character limit
> 
> v3:
> + Move ipe_load_properties to patch 04.
> + Remove useless 0-initializations Prefix extern variables with ipe_
> + Remove kernel module parameters, as these are exposed through sysctls.
> + Add more prose to the IPE base config option help text.
> + Use GFP_KERNEL for audit_log_start.
> + Remove unnecessary caching system.
> + Remove comments from headers
> + Use rcu_access_pointer for rcu-pointer null check
> + Remove usage of reqprot; use prot only.
> +Move policy load and activation audit event to 03/12
> 
> v4:
> + Remove sysctls in favor of securityfs nodes
> + Re-add kernel module parameters, as these are now exposed through securityfs.
> + Refactor property audit loop to a separate function.
> 
> v5:
> + fix minor grammatical errors
> + do not group rule by curly-brace in audit record,
> + reconstruct the exact rule.
> 
> v6:
> + No changes
> 
> v7:
> + Further split lsm creation into a separate commit from the evaluation loop and audit system, for easier review.
> + Propagating changes to support the new ipe_context structure in the evaluation loop.
> 
> v8:
> + Remove ipe_hook enumeration; hooks can be correlated via syscall record.
> 
> v9:
> + Remove ipe_context related code and simplify the evaluation loop.
> 
> v10:
> + Split eval part and boot_verified part
> 
> v11:
> + Fix code style issues
> ---
>  security/ipe/Makefile |  1 +
>  security/ipe/eval.c   | 96 +++++++++++++++++++++++++++++++++++++++++++
>  security/ipe/eval.h   | 24 +++++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 security/ipe/eval.c
>  create mode 100644 security/ipe/eval.h

...

> diff --git a/security/ipe/eval.c b/security/ipe/eval.c
> new file mode 100644
> index 000000000000..5533c359bbeb
> --- /dev/null
> +++ b/security/ipe/eval.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) Microsoft Corporation. All rights reserved.
> + */
> +
> +#include <linux/fs.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/file.h>
> +#include <linux/sched.h>
> +#include <linux/rcupdate.h>
> +
> +#include "ipe.h"
> +#include "eval.h"
> +#include "policy.h"
> +
> +struct ipe_policy __rcu *ipe_active_policy;
> +
> +/**
> + * evaluate_property - Analyze @ctx against a property.
> + * @ctx: Supplies a pointer to the context to be evaluated.
> + * @p: Supplies a pointer to the property to be evaluated.
> + *
> + * Return:
> + * * true	- The current @ctx match the @p
> + * * false	- The current @ctx doesn't match the @p
> + */
> +static bool evaluate_property(const struct ipe_eval_ctx *const ctx,
> +			      struct ipe_prop *p)
> +{
> +	return false;
> +}
> +
> +/**
> + * ipe_evaluate_event - Analyze @ctx against the current active policy.
> + * @ctx: Supplies a pointer to the context to be evaluated.
> + *
> + * This is the loop where all policy evaluation happens against IPE policy.
> + *
> + * Return:
> + * * 0		- OK
> + * * -EACCES	- @ctx did not pass evaluation.
> + * * !0		- Error
> + */
> +int ipe_evaluate_event(const struct ipe_eval_ctx *const ctx)
> +{
> +	bool match = false;
> +	enum ipe_action_type action;
> +	struct ipe_policy *pol = NULL;
> +	const struct ipe_rule *rule = NULL;
> +	const struct ipe_op_table *rules = NULL;
> +	struct ipe_prop *prop = NULL;
> +
> +	rcu_read_lock();
> +
> +	pol = rcu_dereference(ipe_active_policy);
> +	if (!pol) {
> +		rcu_read_unlock();
> +		return 0;
> +	}
> +
> +	if (ctx->op == IPE_OP_INVALID) {
> +		rcu_read_unlock();
> +		if (pol->parsed->global_default_action == IPE_ACTION_DENY)
> +			return -EACCES;

Assuming that the RCU lock protects @pol, shouldn't it be held until
after the global_default_action comparison?

> +		return 0;
> +	}
> +
> +	rules = &pol->parsed->rules[ctx->op];
> +
> +	list_for_each_entry(rule, &rules->rules, next) {
> +		match = true;
> +
> +		list_for_each_entry(prop, &rule->props, next) {
> +			match = match && evaluate_property(ctx, prop);

The @match variable will always be true on the right side above, or am
I missing something?

> +			if (!match)
> +				break;
> +		}
> +
> +		if (match)
> +			break;
> +	}
> +
> +	if (match)
> +		action = rule->action;
> +	else if (rules->default_action != IPE_ACTION_INVALID)
> +		action = rules->default_action;
> +	else
> +		action = pol->parsed->global_default_action;
> +
> +	rcu_read_unlock();
> +	if (action == IPE_ACTION_DENY)
> +		return -EACCES;
> +
> +	return 0;
> +}

--
paul-moore.com

