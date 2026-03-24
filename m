Return-Path: <linux-doc+bounces-80985-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDx1BGCnwmkyggQAu9opvQ
	(envelope-from <linux-doc+bounces-80985-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 16:01:52 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2F0317956
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 16:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E584E313B402
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 14:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF323FE640;
	Tue, 24 Mar 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QeHzDmRP"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7FE3644B3;
	Tue, 24 Mar 2026 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364102; cv=none; b=hsuhd3f05jBCTN6O9kuWY/HVMswSrCdBw9NqH2N5bDEicDfMU/ZfiEEUFxu6skTWMK5CSqIT6+98QQPVpDo8CkvhnlicmMf0GpPkDLW7RfdNg9ntK+iPZQKRUsoLvDFIdA1nUuiT6WyZdWRaczcCvxttDcEgK06m5ed5xriJUg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364102; c=relaxed/simple;
	bh=7m7jcKmXqO1sTQ38TYr7OO0Ri9bYkWMYtiPW+oyCnhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+iu9wuvzfqVm6+xauqLEkhwG/jzX9kudVS2h/popO7Cvta8If9Z18paFjDHSLzNHrAM8mrTU6gccc8VUQhdHZjdJ1TF7EFcSX1yhK+suT9mB0Mc/zKT2bKwYEMdrVl4pi5HcPDZPKvcjluzGtssmiYzxbcn/wqvddBUvYoa8gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QeHzDmRP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31F9D14BF;
	Tue, 24 Mar 2026 07:54:53 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 638653F915;
	Tue, 24 Mar 2026 07:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774364099; bh=7m7jcKmXqO1sTQ38TYr7OO0Ri9bYkWMYtiPW+oyCnhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QeHzDmRP3CWEWa1dRjkF7lnY5fVKH35+Xc8iZ1/5hFYcWjbCv9eSKtaqkVr631zYb
	 dT8OyLdPKcwtyToCPTPFu9m1MZz+kFhZYoaBjJYIS/qQbSMa5lhnjKl0HLOeYsPyx9
	 YdVaPlvHAelmubIFhR57Vu6REfoDt0hC+pta+t8g=
Message-ID: <0f8d0966-4e05-4d5a-a523-098b3dbcf7d9@arm.com>
Date: Tue, 24 Mar 2026 14:54:54 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v10 28/30] KVM: arm64: selftests: Skip impossible invalid
 value tests
To: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-28-43f7683a0fb7@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260306-kvm-arm64-sme-v10-28-43f7683a0fb7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-80985-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F2F0317956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

On 3/6/26 17:01, Mark Brown wrote:
> The set_id_regs test currently assumes that there will always be invalid
> values available in bitfields for it to generate but this may not be the
> case if the architecture has defined meanings for every possible value for
> the bitfield. An assert added in commit bf09ee918053e ("KVM: arm64:
> selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user") refuses to
> run for single bit fields which will show the issue most readily but there
> is no reason wider ones can't show the same issue.
> 
> Rework the tests for invalid value to check if an invalid value can be
> generated and skip the test if not, removing the assert.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 63 +++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index bfca7be3e766..928e7d9e5ab7 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -317,11 +317,12 @@ uint64_t get_safe_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
>  }
>  
>  /* Return an invalid value to a given ftr_bits an ftr value */
> -uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
> +uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr,
> +			   bool *skip)
>  {
>  	uint64_t ftr_max = ftr_bits->mask >> ftr_bits->shift;
>  
> -	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
> +	*skip = false;
>  
>  	if (ftr_bits->sign == FTR_UNSIGNED) {
>  		switch (ftr_bits->type) {
> @@ -329,42 +330,81 @@ uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
>  			ftr = max((uint64_t)ftr_bits->safe_val + 1, ftr + 1);
>  			break;
>  		case FTR_LOWER_SAFE:
> +			if (ftr == ftr_max)
> +				*skip = true;
>  			ftr++;
>  			break;
>  		case FTR_HIGHER_SAFE:
> +			if (ftr == 0)
> +				*skip = true;
>  			ftr--;
>  			break;
>  		case FTR_HIGHER_OR_ZERO_SAFE:
> -			if (ftr == 0)
> +			switch (ftr) {
> +			case 0:
>  				ftr = ftr_max;
> -			else
> +				break;
> +			case 1:
> +				*skip = true;
> +				break;
> +			default:
>  				ftr--;
> +				break;
> +			}
>  			break;
>  		default:
> +			*skip = true;
>  			break;
>  		}
>  	} else if (ftr != ftr_max) {
>  		switch (ftr_bits->type) {
>  		case FTR_EXACT:
>  			ftr = max((uint64_t)ftr_bits->safe_val + 1, ftr + 1);
> +			if (ftr >= ftr_max)
> +				*skip = true;
>  			break;
>  		case FTR_LOWER_SAFE:
>  			ftr++;
>  			break;
>  		case FTR_HIGHER_SAFE:
> -			ftr--;
> +			/* FIXME: "need to check for the actual highest." */
> +			if (ftr == ftr_max)
> +				*skip = true;
> +			else
> +				ftr--;
>  			break;
>  		case FTR_HIGHER_OR_ZERO_SAFE:
> -			if (ftr == 0)
> -				ftr = ftr_max - 1;
> -			else
> +			switch (ftr) {
> +			case 0:
> +				if (ftr_max > 1)
> +					ftr = ftr_max - 1;
> +				else
> +					*skip = true;
> +				break;
> +			case 1:
> +				*skip = true;
> +				break;
> +			default:
>  				ftr--;
> +				break;
> +			}
>  			break;
>  		default:
> +			*skip = true;
>  			break;
>  		}
>  	} else {
> -		ftr = 0;
> +		switch (ftr_bits->type) {
> +		case FTR_LOWER_SAFE:
> +			if (ftr == 0)
> +				*skip = true;
> +			else
> +				ftr = 0;
> +			break;
> +		default:
> +			*skip = true;
> +			break;
> +		}
>  	}

I hacked up a quick loop to check what this function is doing.
With a mask=0x1 I see some value returned that have bits set
outside of the mask.

safe_val ftr out

UNSIGNED

FTR_EXACT
0x0 0x0 0x1
0x0 0x1 0x2 # out of range
0x1 0x0 0x2 # out of range
0x1 0x1 0x2 # out of range
FTR_LOWER_SAFE
0x0 0x0 0x1
0x0 0x1 SKIP
0x1 0x0 0x1
0x1 0x1 SKIP
FTR_HIGHER_SAFE
0x0 0x0 SKIP
0x0 0x1 0x0
0x1 0x0 SKIP
0x1 0x1 0x0
FTR_HIGHER_OR_ZERO_SAFE
0x0 0x0 0x1
0x0 0x1 SKIP
0x1 0x0 0x1
0x1 0x1 SKIP

SIGNED

FTR_EXACT
0x0 0x0 SKIP
0x0 0x1 SKIP
0x1 0x0 SKIP
0x1 0x1 SKIP
FTR_LOWER_SAFE
0x0 0x0 0x1
0x0 0x1 0x0
0x1 0x0 0x1
0x1 0x1 0x0
FTR_HIGHER_SAFE
0x0 0x0 0xffffffffffffffff # out of range
0x0 0x1 SKIP
0x1 0x0 0xffffffffffffffff # out of range
0x1 0x1 SKIP
FTR_HIGHER_OR_ZERO_SAFE
0x0 0x0 SKIP
0x0 0x1 SKIP
0x1 0x0 SKIP
0x1 0x1 SKIP

Thanks,

Ben

>  
>  	return ftr;
> @@ -399,12 +439,15 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, uint64_t reg,
>  	uint8_t shift = ftr_bits->shift;
>  	uint64_t mask = ftr_bits->mask;
>  	uint64_t val, old_val, ftr;
> +	bool skip;
>  	int r;
>  
>  	val = vcpu_get_reg(vcpu, reg);
>  	ftr = (val & mask) >> shift;
>  
> -	ftr = get_invalid_value(ftr_bits, ftr);
> +	ftr = get_invalid_value(ftr_bits, ftr, &skip);
> +	if (skip)
> +		return;
>  
>  	old_val = val;
>  	ftr <<= shift;
> 


