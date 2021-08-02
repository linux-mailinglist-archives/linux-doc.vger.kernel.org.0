Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BBD3DD509
	for <lists+linux-doc@lfdr.de>; Mon,  2 Aug 2021 14:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbhHBMB0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Aug 2021 08:01:26 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44374 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbhHBMBZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Aug 2021 08:01:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627905676; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=2TAtXvlUUR0mBh67yB7f449WY+htKivr3VQmX7vMj9Y=; b=H2mYdUe1tiMq/VQ+cbKA9dG+zQ6Jdv4JLz33ekpnQXDXFT55AzYaa/aJ/EmGCoRXc5q2lRxk
 Z60lLiLSAVhDwe/TucCDYEodAT+YcjEwFhFg6WNFEYG87iWKIOTmRJAOwzOxe3pDk8OQW7rD
 42YmvXKg4zahZsd+uXKB3pXADGU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIzNjUxMiIsICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6107de5a17c2b4047d859d6b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 12:00:26
 GMT
Sender: charante=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C44C7C43460; Mon,  2 Aug 2021 12:00:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.110] (unknown [49.37.157.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: charante)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E568FC43460;
        Mon,  2 Aug 2021 12:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E568FC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=charante@codeaurora.org
Subject: Re: [PATCH V5] mm: compaction: support triggering of proactive
 compaction by user
To:     Mike Rapoport <rppt@kernel.org>
Cc:     akpm@linux-foundation.org, mcgrof@kernel.org,
        keescook@chromium.org, yzaikin@google.com,
        dave.hansen@linux.intel.com, vbabka@suse.cz,
        mgorman@techsingularity.net, nigupta@nvidia.com, corbet@lwn.net,
        khalid.aziz@oracle.com, rientjes@google.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        vinmenon@codeaurora.org
References: <1627653207-12317-1-git-send-email-charante@codeaurora.org>
 <YQRTqNF3xn+tB+qN@kernel.org>
From:   Charan Teja Kalla <charante@codeaurora.org>
Message-ID: <1089d373-221e-7094-b778-ac260ca139a5@codeaurora.org>
Date:   Mon, 2 Aug 2021 17:30:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQRTqNF3xn+tB+qN@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks Mike for the review!!

On 7/31/2021 1:01 AM, Mike Rapoport wrote:
>> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
>> index 003d5cc..b526cf6 100644
>> --- a/Documentation/admin-guide/sysctl/vm.rst
>> +++ b/Documentation/admin-guide/sysctl/vm.rst
>> @@ -118,7 +118,8 @@ compaction_proactiveness
>>  
>>  This tunable takes a value in the range [0, 100] with a default value of
>>  20. This tunable determines how aggressively compaction is done in the
>> -background. Setting it to 0 disables proactive compaction.
>> +background. On write of non zero value to this tunable will immediately
> Nit: I think "Write of non zero ..."

Can Andrew change it while applying the patch ?

> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
Forum, a Linux Foundation Collaborative Project
