Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3D05FC186
	for <lists+linux-doc@lfdr.de>; Wed, 12 Oct 2022 09:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiJLHzz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 12 Oct 2022 03:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiJLHzw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Oct 2022 03:55:52 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03935E30A
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 00:55:50 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id b15so14630863pje.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiqNvIkOrZUzletpRV3bkCPEPfM+NFMYt7swiI2PMTg=;
        b=eWwavECkNBx7QDz3LrB5tUigO6qg+o/VFkgPbH/i4E9uOLTWrmHuji/EqOwlqmNZ/4
         CHijdWChIMxdO+ZtQu5JBp58xwglXywYbjPhiebzNPDrl7xTDNW90igd/aWecF9xZsch
         u37EX40PeR89u8lripyec1NSK0qBIWu+4c0teNsZLb6C+x/jfW+1ZMmSi6H9M1ONW+mB
         yOzvpQ2j7dhknBUg4YVPqzRD/qspgPW4P8l7dBuAdNkIt/dVmD9H1faPStcHveMXCd6C
         j2zQzaPXtLdgDFu2PDUxM/a4EazEqNJRLSS+DIvuR36jw/zYDfCk1bU6aOjoqxQVa+vJ
         S5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qiqNvIkOrZUzletpRV3bkCPEPfM+NFMYt7swiI2PMTg=;
        b=vTDGnd3L7YBxLksIGFKf9heubI99YIrgsUDMXOwpvhLPRyClZyvX/FkS3frx9uW2h6
         6SHPKCbGUTFojIvIfplDovbK8ed9xcavxFEdsbm7Lzx1ghrWbnl8jTKtrDc1PewYWEXw
         t+0WMU4viK1mR13n838YphJId7ZpD+aYz+uO3Hoc+WwYkRt+5tCP3Jbgt6fr+rXB9CpP
         TDn0nNYH44Rq5u6EyUn6T8igxov7Lw7uiRkYHjqP3KINUks2WoA6FnUjQZEGujha44T3
         o1GRMsBiIKiGS3wgn0DzG5hTKeEuaEAzs+AWa0qlqnj8RHaoLx/00fqXWXn0KIRxHUZc
         Gr3g==
X-Gm-Message-State: ACrzQf213/R7vAxKivwIBp/dS0mHoFdIXVAdVHgsI2pcc58xm3l8AzAB
        XQxDlAv29lwVHbjxb8vJiQoMPA==
X-Google-Smtp-Source: AMsMyM6Mop5fQSWO9SSyVhxQQI6VpyWF9Lwlbp0HTZdM2K3anCfuy8BCtnUThbozq5SvynKT1CbmCw==
X-Received: by 2002:a17:902:c94d:b0:17d:9ea9:9c02 with SMTP id i13-20020a170902c94d00b0017d9ea99c02mr29512846pla.68.1665561350354;
        Wed, 12 Oct 2022 00:55:50 -0700 (PDT)
Received: from [10.68.76.92] ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id o11-20020a17090ab88b00b0020af2411721sm789475pjr.34.2022.10.12.00.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 00:55:49 -0700 (PDT)
Message-ID: <582cf257-bc0d-c96e-e72e-9164cff4fce1@bytedance.com>
Date:   Wed, 12 Oct 2022 15:55:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [External] Re: [RFC] mm: add new syscall pidfd_set_mempolicy()
To:     Michal Hocko <mhocko@suse.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, wuyun.abel@bytedance.com
References: <20221010094842.4123037-1-hezhongkun.hzk@bytedance.com>
 <Y0WEbCqJHjnqsg8n@dhcp22.suse.cz>
From:   Zhongkun He <hezhongkun.hzk@bytedance.com>
In-Reply-To: <Y0WEbCqJHjnqsg8n@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi  michal, thanks for your reply and suggestiones.

> Please add some explanation why the cpuset interface is not usable for
> that usecase.
OK.

>> To solve the issue, this patch introduces a new syscall
>> pidfd_set_mempolicy(2).  it sets the NUMA memory policy of the thread
>> specified in pidfd.
>>
>> In current process context there is no locking because only the process
>> accesses its own memory policy, so task_work is used in
>> pidfd_set_mempolicy() to update the mempolicy of the process specified
>> in pidfd, avoid using locks and race conditions.
> 
> Why cannot you alter kernel_set_mempolicy (and do_set_mempolicy) to
> accept a task rather than operate on current?

I have tried it before this patch, but I found a problem.The allocation 
and update of mempolicy are in the current context, so it is not 
protected by any lock.But when the mempolicy is modified by other 
processes, the race condition appears.
Say something like the following

	pidfd_set_mempolicy	     target task stack
				       alloc_pages
					mpol = get_task_policy;
	 task_lock(task);
	 old = task->mempolicy;
	 task->mempolicy = new;
	 task_unlock(task);
	 mpol_put(old);			
					page = __alloc_pages(mpol);
There is a situation that when the old mempolicy is released, the target 
task is still using the policy.It would be better if there are 
suggestions on this case.

> I have to really say that I dislike the task_work approach because it
> detaches the syscall from the actual operation and the caller simply
> doesn't know when the operation has been completed.

I agree with you.This is indeed a problem.

> Please also describe the security model.got it.
