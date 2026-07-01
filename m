Return-Path: <linux-doc+bounces-94498-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /59VBTSHRWpJBgsAu9opvQ
	(envelope-from <linux-doc+bounces-94498-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 23:31:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B6E6F1D8C
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 23:31:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XVTH5jvY;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94498-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94498-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E6F13012CE5
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 21:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0453B7753;
	Wed,  1 Jul 2026 21:31:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCAA3A5E90;
	Wed,  1 Jul 2026 21:31:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941478; cv=none; b=jV37UIAd5x0z6GF53a2FBUmrFRFY8RryW3PB+mNMBUp+5JANPy8civbT2jUDmmn4w/syICMnUed3wrqRaVxwH4RwA5JkhAgHCjG7TKnNWOGp5ydwFo2MtS5KO33hZyRmwD4IVtUJGhXSIP76PQeyrofPtMd1tdXzN6y2+Sp37x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941478; c=relaxed/simple;
	bh=P4pjeIpeC9oBr6zrCF9cfBuDgSXlQuduxaO1jy7GGUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnOrFrWuDy6H/81rEGkNvsvXBbpHQcdHViV7P/bts/v9ET/rCKgGKrAudaAXNxeKuX2vi6uqCwYv0zjhrdwhUnND+/z25ndspIBBIHW0ypUqjdjim7NSURPFJ6qQTSxaBnXTtdSyOfiT+RwY2okAcvhPgdFY5X3cAvaQ9tL+IhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVTH5jvY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7161A1F000E9;
	Wed,  1 Jul 2026 21:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941477;
	bh=g4DLYVTz7w4Jq1+P6/AUcLiSJEIVAqYpmUXO6uzMB3U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XVTH5jvYSNGeQlhZEawrhcsTnEXk1MTJ9JIPCoIKQBf4I3VHpM3c6z+YjzQT4CCOI
	 jYTvvGGw8Y3YM6rz1txIjJd+F0YKUsnn4vEIedO2/QhwZaCHZ7L4CWU+vsNwdBDTsF
	 Co84wKp8mUS+PV9Qu+dCNm7IdfRA8vdWDreHjSNocycHUQJN3/xlabnvIR3gKOe4qx
	 D5rvOePypV+u+Oemm1nIJd4QStEA4GhE38KvsJyb/IKljcT1GjF0UNwwOg85Xfzh0l
	 lfN3fpLKTF7i1WJ/OfwyZAxl9Yv0MpvV3yn0FYFtMT15RSR1OSXVXWu3nkDW9KBxCR
	 TfUcwEUDbimWQ==
Message-ID: <f0ffaa93-946d-4792-be28-db75a309e3ab@kernel.org>
Date: Wed, 1 Jul 2026 16:31:15 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] cpufreq/amd-pstate: Extract platform profile to
 EPP conversion into a helper
Content-Language: en-US
To: K Prateek Nayak <kprateek.nayak@amd.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Huang Rui <ray.huang@amd.com>
Cc: Perry Yuan <perry.yuan@amd.com>, linux-pm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630185904.5602-1-kprateek.nayak@amd.com>
 <20260630185904.5602-2-kprateek.nayak@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260630185904.5602-2-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94498-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kprateek.nayak@amd.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:ray.huang@amd.com,m:perry.yuan@amd.com,m:linux-pm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[superm1@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,amd.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41B6E6F1D8C



On 6/30/26 13:58, K Prateek Nayak wrote:
> Avoid duplication by extracting the switch case that derives EPP based
> on platform profile into the amd_pstate_get_epp_from_platform_profile()
> helper.
> 
> No functional changes intended.
> 
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/cpufreq/amd-pstate.c | 67 +++++++++++++++++-------------------
>   1 file changed, 32 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
> index 20c30d14100f..1893b0054a6a 100644
> --- a/drivers/cpufreq/amd-pstate.c
> +++ b/drivers/cpufreq/amd-pstate.c
> @@ -1179,6 +1179,24 @@ static int amd_pstate_power_supply_notifier(struct notifier_block *nb,
>   	return NOTIFY_OK;
>   }
>   
> +static int amd_pstate_get_epp_from_platform_profile(struct cpufreq_policy *policy,
> +						    enum platform_profile_option profile)
> +{
> +	switch (profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		return AMD_CPPC_EPP_PERFORMANCE;
> +	case PLATFORM_PROFILE_BALANCED:
> +		return amd_pstate_get_balanced_epp(policy);
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		return AMD_CPPC_EPP_POWERSAVE;
> +	default:
> +		break;
> +	}
> +
> +	pr_err("Unknown Platform Profile %d\n", profile);
> +	return -EOPNOTSUPP;
> +}
> +
>   static int amd_pstate_profile_probe(void *drvdata, unsigned long *choices)
>   {
>   	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> @@ -1204,28 +1222,16 @@ static int amd_pstate_profile_set(struct device *dev,
>   	struct amd_cpudata *cpudata = dev_get_drvdata(dev);
>   	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(cpudata->cpu);
>   	int ret;
> +	u8 epp;
>   
> -	switch (profile) {
> -	case PLATFORM_PROFILE_LOW_POWER:
> -		ret = amd_pstate_set_epp(policy, AMD_CPPC_EPP_POWERSAVE);
> -		if (ret)
> -			return ret;
> -		break;
> -	case PLATFORM_PROFILE_BALANCED:
> -		ret = amd_pstate_set_epp(policy,
> -					 amd_pstate_get_balanced_epp(policy));
> -		if (ret)
> -			return ret;
> -		break;
> -	case PLATFORM_PROFILE_PERFORMANCE:
> -		ret = amd_pstate_set_epp(policy, AMD_CPPC_EPP_PERFORMANCE);
> -		if (ret)
> -			return ret;
> -		break;
> -	default:
> -		pr_err("Unknown Platform Profile %d\n", profile);
> -		return -EOPNOTSUPP;
> -	}
> +	ret = amd_pstate_get_epp_from_platform_profile(policy, profile);
> +	if (ret < 0)
> +		return ret;
> +
> +	epp = (u8)ret;
> +	ret = amd_pstate_set_epp(policy, epp);
> +	if (ret)
> +		return ret;
>   
>   	cpudata->current_profile = profile;
>   
> @@ -1259,20 +1265,11 @@ static int amd_pstate_set_dynamic_epp(struct cpufreq_policy *policy)
>   	int ret;
>   	u8 epp;
>   
> -	switch (cpudata->current_profile) {
> -	case PLATFORM_PROFILE_PERFORMANCE:
> -		epp = AMD_CPPC_EPP_PERFORMANCE;
> -		break;
> -	case PLATFORM_PROFILE_LOW_POWER:
> -		epp = AMD_CPPC_EPP_POWERSAVE;
> -		break;
> -	case PLATFORM_PROFILE_BALANCED:
> -		epp = amd_pstate_get_balanced_epp(policy);
> -		break;
> -	default:
> -		pr_err("Unknown Platform Profile %d\n", cpudata->current_profile);
> -		return -EOPNOTSUPP;
> -	}
> +	ret = amd_pstate_get_epp_from_platform_profile(policy, cpudata->current_profile);
> +	if (ret < 0)
> +		return ret;
> +
> +	epp = (u8)ret;
>   	ret = amd_pstate_set_epp(policy, epp);
>   	if (ret)
>   		return ret;


