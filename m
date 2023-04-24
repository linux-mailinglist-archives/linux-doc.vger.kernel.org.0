Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22D256E0E11
	for <lists+linux-doc@lfdr.de>; Thu, 13 Apr 2023 15:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjDMNIb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Apr 2023 09:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjDMNIa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 09:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19A89768
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 06:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681391258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xu3cDrGly0wJnGXrRec8HvQ04SIjk5VxPaKdFOL3odc=;
        b=VUfjnHpPFUyT8EVl+eiYEJZE6IrMjH/+eBDh9YmhanxeMugAeOFP7xZ0PNDxFu+BZLpovU
        3WLHAfIsg3H03teVIOmeNKKvD91Ze4XiqMTF6dy98iaQ4mCzqwLKeMyyNPeNlbahfqX4WR
        C61au3o+25km0TjtC3F4XadzvTvmz0Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-kDQN29mjP_OKyF-Cg7uJIg-1; Thu, 13 Apr 2023 09:07:37 -0400
X-MC-Unique: kDQN29mjP_OKyF-Cg7uJIg-1
Received: by mail-wm1-f69.google.com with SMTP id fm19-20020a05600c0c1300b003f0a9e986bcso401479wmb.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 06:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391256; x=1683983256;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xu3cDrGly0wJnGXrRec8HvQ04SIjk5VxPaKdFOL3odc=;
        b=l+sXK1NHaUUYOzXfKL9FgaWaNc01adWJRLYfr3l0N6gklkjJc28UlR/SKtShol45yY
         D2SEy0t5TI6ewL4mwZgNTP3DtzR8tzotRxnlP+RoyB+/DSk18GOniiaFz5aeu4JQQCOW
         gNztRMUxx/j0wtvdKY3ybaeahzpdOw4ibdpippFoe1vbpCjzFQBIzgGuL9cCgkGsFblg
         9TQghy11/GKoMi9BSWry4G4wrVF96nyDldZz5ETbXCYMV+fk1osg2FmwcikW4P00VqYN
         J2PgZBjsTRrENt7X48AuxLZyGj3rFGdBLxIUahKoA2UFu5ZRtDuqDJunivAJx0yL2SUf
         +ZAQ==
X-Gm-Message-State: AAQBX9fwpIPr3VvacYoH0/4eVBJaFEIyakho0RFKWi2Sy5JraSsyX+sZ
        b+Z+NAp2ESzR7zzEaeBtw24RjmYbOak2UmtDkYVM8Tqd1jwW6O+j71AVPJgPnMAsDXAxfV4BXHw
        ZKm3+E+es8Qaobjc+wyS0
X-Received: by 2002:adf:d0cc:0:b0:2cf:ec75:8090 with SMTP id z12-20020adfd0cc000000b002cfec758090mr1405072wrh.14.1681391256422;
        Thu, 13 Apr 2023 06:07:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZAf2dTIXalDT1vqm+8Q7R/XyJbZOQfYNc5Rhgq/eKzSYm1AAjZ4JIiIbog4wnJj4wKIcBFQA==
X-Received: by 2002:adf:d0cc:0:b0:2cf:ec75:8090 with SMTP id z12-20020adfd0cc000000b002cfec758090mr1405053wrh.14.1681391256006;
        Thu, 13 Apr 2023 06:07:36 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d43cb000000b002f490a0cd1asm1246303wrr.92.2023.04.13.06.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:07:35 -0700 (PDT)
Message-ID: <7c5606cc-ca58-c505-b0d3-2eec29fe606a@redhat.com>
Date:   Thu, 13 Apr 2023 15:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc:     linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org, willy@infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230412031648.2206875-1-shr@devkernel.io>
 <20230412031648.2206875-4-shr@devkernel.io>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v6 3/3] selftests/mm: add new selftests for KSM
In-Reply-To: <20230412031648.2206875-4-shr@devkernel.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12.04.23 05:16, Stefan Roesch wrote:
> This adds three new tests to the selftests for KSM.  These tests use the
> new prctl API's to enable and disable KSM.
> 
> 1) add new prctl flags to prctl header file in tools dir
> 
>     This adds the new prctl flags to the include file prct.h in the
>     tools directory.  This makes sure they are available for testing.
> 
> 2) add KSM prctl merge test
> 
>     This adds the -t option to the ksm_tests program.  The -t flag
>     allows to specify if it should use madvise or prctl ksm merging.
> 
> 3) add KSM get merge type test
> 
>     This adds the -G flag to the ksm_tests program to query the KSM
>     status with prctl after KSM has been enabled with prctl.
> 
> 4) add KSM fork test
> 
>     Add fork test to verify that the MMF_VM_MERGE_ANY flag is inherited
>     by the child process.
> 
> 5) add two functions for debugging merge outcome
> 
>     This adds two functions to report the metrics in /proc/self/ksm_stat
>     and /sys/kernel/debug/mm/ksm.
> 
> The debugging can be enabled with the following command line:
> make -C tools/testing/selftests TARGETS="mm" --keep-going \
>          EXTRA_CFLAGS=-DDEBUG=1

Would it make sense to instead have a "-D" (if still unused) runtime 
options to print this data? Dead code that's not compiled is a bit 
unfortunate as it can easily bit-rot.



This patch essentially does two things

1) Add the option to run all tests/benchmarks with the PRCTL instead of 
MADVISE

2) Add some functional KSM tests for the new PRCTL (fork, enabling 
works, disabling works).

The latter should rather go into ksm_functional_tests().

[...]

>   
> -static int check_ksm_unmerge(int mapping, int prot, int timeout, size_t page_size)
> +/* Verify that prctl ksm flag is inherited. */
> +static int check_ksm_fork(void)
> +{
> +	int rc = KSFT_FAIL;
> +	pid_t child_pid;
> +
> +	if (prctl(PR_SET_MEMORY_MERGE, 1)) {
> +		perror("prctl");
> +		return KSFT_FAIL;
> +	}
> +
> +	child_pid = fork();
> +	if (child_pid == 0) {
> +		int is_on = prctl(PR_GET_MEMORY_MERGE, 0);
> +
> +		if (!is_on)
> +			exit(KSFT_FAIL);
> +
> +		exit(KSFT_PASS);
> +	}
> +
> +	if (child_pid < 0)
> +		goto out;
> +
> +	if (waitpid(child_pid, &rc, 0) < 0)
> +		rc = KSFT_FAIL;
> +
> +	if (prctl(PR_SET_MEMORY_MERGE, 0)) {
> +		perror("prctl");
> +		rc = KSFT_FAIL;
> +	}
> +
> +out:
> +	if (rc == KSFT_PASS)
> +		printf("OK\n");
> +	else
> +		printf("Not OK\n");
> +
> +	return rc;
> +}
> +
> +static int check_ksm_get_merge_type(void)
> +{
> +	if (prctl(PR_SET_MEMORY_MERGE, 1)) {
> +		perror("prctl set");
> +		return 1;
> +	}
> +
> +	int is_on = prctl(PR_GET_MEMORY_MERGE, 0);
> +
> +	if (prctl(PR_SET_MEMORY_MERGE, 0)) {
> +		perror("prctl set");
> +		return 1;
> +	}
> +
> +	int is_off = prctl(PR_GET_MEMORY_MERGE, 0);
> +
> +	if (is_on && is_off) {
> +		printf("OK\n");
> +		return KSFT_PASS;
> +	}
> +
> +	printf("Not OK\n");
> +	return KSFT_FAIL;
> +}

Yes, these two are better located in ksm_functional_tests() to just run 
them both automatically when the test is executed.

-- 
Thanks,

David / dhildenb

