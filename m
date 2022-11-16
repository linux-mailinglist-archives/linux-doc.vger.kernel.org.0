Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED9DC62B6AB
	for <lists+linux-doc@lfdr.de>; Wed, 16 Nov 2022 10:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbiKPJiT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Nov 2022 04:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbiKPJiR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 04:38:17 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA82BD13B
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 01:38:15 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id l2so15886029pld.13
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 01:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED3dVZVhTXurH9uVn9Km9+qzSuteSy+hO2CW2MEdWTU=;
        b=I/7hBPwo37uWwdiPvScqp5Wub/IybcuswDPzUWm8rPIFGRsJNEuTVzrGQec8Ow/l/d
         aKnmhZEjWitb73ekE3JC0wqz1Oep1X0J2fzqil9JzjWCl3ue1ogO8l8x0Nrp0Y3vebvA
         HFfs+KKvymqM4vfSpUHJQ/C8Ga7T3aTpHhqukRCmkCDrYDZFBuCnjK0du8NuQRg+alzJ
         i5tjHe9Y5bMNOUAwOjs+QWG+c2OtcYzs4E09M+1P90Lg3JgRx2+/lIppdhPFqVVL/HLg
         hiOawDrc9p4LqIRHMEKakCa77RJmZq5YG8kly2mNrLV/9e74LnZ6CGCWYdbcJoyX0ZsG
         BzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ED3dVZVhTXurH9uVn9Km9+qzSuteSy+hO2CW2MEdWTU=;
        b=HQXh+APCbx8wkQZTEYgh3QS76HQA3/ptuY7SEmw+AAfpHT15cwkoue0pdBGEHpdsLl
         CqHIEEYWOisnpcN0kPt0xm89BaAtg361HJMMrlqsmYe0LiJauAfOCR8e+w8B7OyvaPQ0
         0xMEsw7Z/biTXXF0nFPmsDuC6oLq6bgVBXdbjZBdWmNuRmG7848cVHS29hMnRkGYUfnd
         JhPoutka10aUx7dcDx+cAwilyl4/dMwNR1GCwtviaZ9r8qqY2d363p0dafj0qXCXhAy+
         qNOmH3obHKbrkvbSq1lTzsgVv3owYy1yQqrRcNOX36z2FiJ6i0Ir0eeBWWWaMI146+ue
         p+aQ==
X-Gm-Message-State: ANoB5pkNbt0zJ2RSRLnodY94sYZtQzMpAE8ITrgk799aRgZ8j3y2xQ3e
        J3CwvfYnfs72Q7Hw+Ow3yz3mBg==
X-Google-Smtp-Source: AA0mqf6mO/o9kgca96vOeZ6qwUazWfcWU/RyXDHE4Gy+8A40ZFbYqCJCwRW5uzjdX4dDB5SHOuDr3A==
X-Received: by 2002:a17:902:b694:b0:187:337a:b2a1 with SMTP id c20-20020a170902b69400b00187337ab2a1mr8336586pls.96.1668591495172;
        Wed, 16 Nov 2022 01:38:15 -0800 (PST)
Received: from [10.68.76.92] ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id e24-20020a63f558000000b00470275c8d6dsm9012484pgk.10.2022.11.16.01.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:38:14 -0800 (PST)
Message-ID: <0445de39-15a4-f645-b380-39f20abb6524@bytedance.com>
Date:   Wed, 16 Nov 2022 17:38:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [External] Re: [PATCH v2] mm: add new syscall
 pidfd_set_mempolicy().
To:     "Huang, Ying" <ying.huang@intel.com>
Cc:     corbet@lwn.net, mhocko@suse.com, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org
References: <20221111084051.2121029-1-hezhongkun.hzk@bytedance.com>
 <87zgcrwfac.fsf@yhuang6-desk2.ccr.corp.intel.com>
From:   Zhongkun He <hezhongkun.hzk@bytedance.com>
In-Reply-To: <87zgcrwfac.fsf@yhuang6-desk2.ccr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Ying, thanks for your replay and suggestions.

> 
> I suggest to move the flags in "mode" parameter (MPOL_F_STATIC_NODES,
> MPOL_F_RELATIVE_NODES, MPOL_F_NUMA_BALANCING, etc.) to "flags"
> parameter, otherwise, why add it?

The "flags" is used for future extension if any, just like
process_madvise() and set_mempolicy_home_node().
Maybe it should be removed.

> 
> And, how about add a "home_node" parameter?  I don't think that it's a
> good idea to add another new syscall for pidfd_set_mempolicy_home_node()
> in the future.
> 

Good idea, but "home_node" is used for vma policy, not task policy.
It is possible to use it in pidfd_mbind() in the future.

> 
> IMHO, "The first four APIS" and "The last one" isn't easy to be
> understood.  How about
> 
> "sys_pidfd_set_mempolicy sets the mempolicy of task specified in the
> pidfd, the others affect only the calling task, ...".
> 

Got it.

> 
> Why add "sys_"?  I fount that there's no "sys_" before set_mempolicy()/mbind() etc.
> 

Got it.

>> +void mpol_put_async(struct task_struct *task, struct mempolicy *p)
> 
> How about change __mpol_put() directly?

> 
> Why can we fall back to freeing directly if task_work_add() failed?
> Should we check the return code and fall back only if -ESRCH and WARN
> for other cases?
> 

A task_work based solution has not been accepted yet, it will be 
considered later if needed.


>> +	}
> 
> Why do we need to write lock mmap_sem?  IIUC, we don't touch vma.
> 

Yes, it should be removed.

>>   /*
> 
> Because we will change task_struct->mempolicy in another task, we need
> to use kind of "load acquire" / "store release" memory order.  For
> example, rcu_dereference() / rcu_assign_pointer(), etc.
> 
Thanks again for your suggestion.

Best Regards,
Zhongkun
