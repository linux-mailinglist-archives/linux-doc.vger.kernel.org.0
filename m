Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF1A171112A
	for <lists+linux-doc@lfdr.de>; Thu, 25 May 2023 18:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238968AbjEYQln (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 25 May 2023 12:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbjEYQlm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 May 2023 12:41:42 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0951F19A
        for <linux-doc@vger.kernel.org>; Thu, 25 May 2023 09:41:40 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so4259415e9.3
        for <linux-doc@vger.kernel.org>; Thu, 25 May 2023 09:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685032899; x=1687624899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tCR9GGMFNorDSK4vdX+Y26zqtl9VCvHN3JUMiQf7Kew=;
        b=o0+muES5ARWipQlSHLAB/7akRAZep94c2231xrpi4KXF9lrhcshS97WUidLAwDlV0z
         RynFU2r3rhKJw/R/nmU6WNfQKB4sdhG5wGjyacVparRSMjT7utlC++3SKNxIWbmEnrqb
         iCHXwHQ5JCmxDfuVyoomnxx5fXlCmn1FrU94WX//iqa63oTjwym++VI7aXvtVcJPJAnk
         NxFrHDfHj4z65JE9h93cXQOWf1cNMP7ZqPFB+34FkNCQsI0ojVWYt5Mptr5g22z9HLCz
         +k1c5zZRwyDfMpndDIIqYhg4r4xDlr4ri4WYXwWXwOy9+6CcBzDuWlNxUyQWJI0UThtJ
         0Gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685032899; x=1687624899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCR9GGMFNorDSK4vdX+Y26zqtl9VCvHN3JUMiQf7Kew=;
        b=Vq2tMBYJJAcASNemKVcfMLmmt38WV95kOH07xHZhsXGD8cWUSaLqN/1DacTuAPc5KM
         m6dQt3wLoUvjJDD0usTRuj3Qq8bAIhW8RvkL+7A2F0Ej6Q3wviC/mXGx/+BBX9cJmz1s
         PsKa0pqKrKGKtqI5JKomM+cR2L1hxUcf6UpY61fkWXwLLdt2L+3Yo9qgTltq75hbFznF
         GJvxZahCMt+1acplbVIMxihh/lgCpM65NbqBenCw+OK+0sIAkZ6kdvP+val54wx2PDRJ
         a9AdL4crIWeSRgzWlfm3TvdbA3XEbUYgbL6Qc5UxC9Prwbeh/QIbGCfbUuPpjitpVp/V
         jEtQ==
X-Gm-Message-State: AC+VfDzdf1ejz8jHz/9Gxyp/euZc+xTVDR089+5L7iMaC/uAQjGee2K3
        eCKpJKu/UvHg0FUUgOj4fDvdrw==
X-Google-Smtp-Source: ACHHUZ53ktqlluQQR/F53uKrM+aSDG4pKo6I8rAgr8k2wvNBb6mDiqz/ahIuAkvn+sNwUSvJ1bkr1w==
X-Received: by 2002:a05:600c:d0:b0:3f6:119:ee11 with SMTP id u16-20020a05600c00d000b003f60119ee11mr3346603wmm.32.1685032899461;
        Thu, 25 May 2023 09:41:39 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d58d0000000b002ffbf2213d4sm2338037wrf.75.2023.05.25.09.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 09:41:39 -0700 (PDT)
Date:   Thu, 25 May 2023 18:41:38 +0200
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Haibo Xu <haibo1.xu@intel.com>
Cc:     xiaobo55x@gmail.com, maz@kernel.org, oliver.upton@linux.dev,
        seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>,
        Vipin Sharma <vipinsh@google.com>,
        Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 10/11] KVM: riscv: selftests: Skip some registers set
 operation
Message-ID: <20230525-50097c796339f56320da7643@orel>
References: <cover.1684999824.git.haibo1.xu@intel.com>
 <a10cd1ff57e07e408d08eca7e6a4557217ca0af3.1684999824.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a10cd1ff57e07e408d08eca7e6a4557217ca0af3.1684999824.git.haibo1.xu@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 25, 2023 at 03:38:34PM +0800, Haibo Xu wrote:
> Set operation on some riscv registers(mostly pesudo ones) was not
> supported and should be skipped in the get-reg-list test. Just
> reuse the rejects_set utilities to handle it in riscv.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/get-reg-list.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index f1fc113e9719..ebd6b580b33b 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -211,16 +211,22 @@ static void run_test(struct vcpu_reg_list *c)
>  			++failed_get;
>  		}
>  
> -		/* rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE */
> +		/*
> +		 * rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE on aarch64,
> +		 * or registers that should skip set operation on riscv.
> +		 */
>  		for_each_sublist(c, s) {
>  			if (s->rejects_set && find_reg(s->rejects_set, s->rejects_set_n, reg.id)) {
>  				reject_reg = true;
> -				ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> -				if (ret != -1 || errno != EPERM) {
> -					printf("%s: Failed to reject (ret=%d, errno=%d) ", config_name(c), ret, errno);
> -					print_reg(config_name(c), reg.id);
> -					putchar('\n');
> -					++failed_reject;
> +				if ((reg.id & KVM_REG_ARCH_MASK) == KVM_REG_ARM64) {
> +					ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +					if (ret != -1 || errno != EPERM) {
> +						printf("%s: Failed to reject (ret=%d, errno=%d) ",
> +								config_name(c), ret, errno);
> +						print_reg(config_name(c), reg.id);
> +						putchar('\n');
> +						++failed_reject;
> +					}
>  				}
>  				break;
>  			}
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
