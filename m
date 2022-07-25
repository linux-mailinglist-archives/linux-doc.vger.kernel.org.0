Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD1957FA7D
	for <lists+linux-doc@lfdr.de>; Mon, 25 Jul 2022 09:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbiGYHx1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Jul 2022 03:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbiGYHx0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 03:53:26 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8369312ABF
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 00:53:24 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id z23so18906425eju.8
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 00:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jQHpcE4C1nH2GCEZXh7ETSpGDaBL6cwEwh9j7gNMWo8=;
        b=OM55UTg0wu+CluQkSUuA01YFDEdR/y4F20whcdzU1hU38os/ei31zozZ3nG+vpyapL
         C4sqPhvVwG2PGmrj2cqmelAHQZjlR2xb+0rcheIVoEhxmBIqe+DaXqmCPnws0bttvYDM
         D89CQaUgpv7QHiWFeRnMIGfTUhLaA+sSrNNlQ2lGk5vBhH85BV8zYTEEb6f7J6x954Ik
         ghxFRwdsElN3pAwFnlfnGAiygd7hZ7un3sZnwbSXymco13wqi4JHyXtohzFegCUej9vR
         IzoaoYzpzs/Y6OsEkHqDtgppAfiM4auffmbGS9I8nRLK4ITgHl+kV21CjuinMnBydi0u
         n2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jQHpcE4C1nH2GCEZXh7ETSpGDaBL6cwEwh9j7gNMWo8=;
        b=KA0GYmR0CFspHYqBZDeQ/r8Kfp7oy8QNcAzgbQSWU/uAKxTSyqZCWCOezADGIGVt58
         IascJs7KZ0PUvZu5N99rQfDMddbkaz1unQiDrz5emYU/3TbVoD6dYE6rVw3E/kudVBR1
         /01/pTTBRvTeNn5RRIv8MNSER6h3iMeFR/PHdnRtuR4YFjBeai3W0QT0jrSNKSH9lelW
         nwjWg8/fSszr2dZ99y3Xa38eWffFfiUBjP4Vvlcmz8XD4dMtKPXmHWwht8VzKNpTBdcr
         7lkUDG+zNQe7nPa4WdBJxQc4JH/XnUJ6OlHz2IO7RkhooDBP8HvODCdVkZSg2f2qj9m7
         8oUg==
X-Gm-Message-State: AJIora84UnfvB4MExmKsEavC97Kh0co119KKcEzJiMVnXkcabABq+pSx
        7bSWK5y0eNgxjYPRKHjc+gHpOw==
X-Google-Smtp-Source: AGRyM1vwhwdAD1fhToosegZ6HJzjjm2A8TIJxILfbOsGmaHcNrwR3F9IeMC7GUh0LFKO8elVo9fdoA==
X-Received: by 2002:a17:906:c781:b0:726:c967:8d1b with SMTP id cw1-20020a170906c78100b00726c9678d1bmr9205707ejb.54.1658735602996;
        Mon, 25 Jul 2022 00:53:22 -0700 (PDT)
Received: from localhost ([85.163.43.78])
        by smtp.gmail.com with ESMTPSA id ot11-20020a170906cccb00b0072af4af2f46sm5008824ejb.74.2022.07.25.00.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 00:53:22 -0700 (PDT)
Date:   Mon, 25 Jul 2022 09:53:21 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Vikas Gupta <vikas.gupta@broadcom.com>, jiri@nvidia.com,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        davem@davemloft.net, dsahern@kernel.org,
        stephen@networkplumber.org, edumazet@google.com, pabeni@redhat.com,
        ast@kernel.org, leon@kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, michael.chan@broadcom.com,
        andrew.gospodarek@broadcom.com
Subject: Re: [PATCH net-next v6 1/2] devlink: introduce framework for
 selftests
Message-ID: <Yt5L8TbzTwthnrl7@nanopsycho>
References: <20220723042206.8104-1-vikas.gupta@broadcom.com>
 <20220723042206.8104-2-vikas.gupta@broadcom.com>
 <20220723091600.1277e903@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220723091600.1277e903@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sat, Jul 23, 2022 at 06:16:00PM CEST, kuba@kernel.org wrote:
>On Sat, 23 Jul 2022 09:52:05 +0530 Vikas Gupta wrote:
>> +enum devlink_attr_selftest_test_id {
>> +	DEVLINK_ATTR_SELFTEST_TEST_ID_UNSPEC,
>> +	DEVLINK_ATTR_SELFTEST_TEST_ID_FLASH,	/* flag */
>> +
>> +	__DEVLINK_ATTR_SELFTEST_TEST_ID_MAX,
>> +	DEVLINK_ATTR_SELFTEST_TEST_ID_MAX = __DEVLINK_ATTR_SELFTEST_TEST_ID_MAX - 1
>> +};
>> +
>> +enum devlink_selftest_test_status {
>> +	DEVLINK_SELFTEST_TEST_STATUS_SKIP,
>> +	DEVLINK_SELFTEST_TEST_STATUS_PASS,
>> +	DEVLINK_SELFTEST_TEST_STATUS_FAIL
>> +};
>> +
>> +enum devlink_attr_selftest_result {
>> +	DEVLINK_ATTR_SELFTEST_RESULT_UNSPEC,
>> +	DEVLINK_ATTR_SELFTEST_RESULT,			/* nested */
>> +	DEVLINK_ATTR_SELFTEST_RESULT_TEST_ID,		/* u32,
>> +							 * enum devlink_attr_selftest_test_id
>> +							 */
>> +	DEVLINK_ATTR_SELFTEST_RESULT_TEST_STATUS,	/* u8,
>> +							 * enum devlink_selftest_test_status
>> +							 */
>> +
>> +	__DEVLINK_ATTR_SELFTEST_RESULT_MAX,
>> +	DEVLINK_ATTR_SELFTEST_RESULT_MAX = __DEVLINK_ATTR_SELFTEST_RESULT_MAX - 1
>
>Any thoughts on running:
>
>	sed -i '/_SELFTEST/ {s/_TEST_/_/g}' $patch

Sure, why not. But please make sure you keep all other related things
(variables, cmdline opts) consistent.

Thanks!


>
>on this patch? For example DEVLINK_ATTR_SELFTEST_RESULT_TEST_STATUS
>is 40 characters long, ain't nobody typing that, and _TEST is repeated..
>
>Otherwise LGTM!
