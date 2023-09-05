Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3F779291F
	for <lists+linux-doc@lfdr.de>; Tue,  5 Sep 2023 18:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350917AbjIEQZR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Sep 2023 12:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354818AbjIEOoE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Sep 2023 10:44:04 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0B7199
        for <linux-doc@vger.kernel.org>; Tue,  5 Sep 2023 07:44:00 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-760dff4b701so35776039f.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Sep 2023 07:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1693925040; x=1694529840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDutPGiBG6Po2dvkxSBUfS+rF+sofgODeMl6ZDUIXuY=;
        b=PKBCuFlftW2zUpE1hg25k20DOb4QmZZG1DbNoBi0L7Vt/KaeJJEvzp+Yivx5EnxMc1
         4LRXV+pq+KBkYy6yF4P+5X8Mqf90BOtjUodDdl95HgtwzO8I3xbfm3hny+XznMI8wx1s
         DgX0d/aRaWeftYz653xG5cE//6zodBdEJrmhsUM8rxNjiewYqOGx0Wwna4xMwFugLvbw
         Tr+cri+sI544kt1/EHEBH77yFEcs6Ea+iOK/qy+X1J3RFh51896S+QZR7av0ou9ch/Dw
         39/mvVWhf8e33M2Umb+uax/mSrDtHa9v3e9qV10xLYPfv6K7tjGZRmtJE7YxT8T/3GKq
         1RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693925040; x=1694529840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDutPGiBG6Po2dvkxSBUfS+rF+sofgODeMl6ZDUIXuY=;
        b=iry7KRc5rKGn36JoJQVrEi5+oT49BzmB+jL3pYC/ing/kCoahy0BRf6xOpJqaJyW+k
         BJ7mTSgMD0p77Lhxq0ZzrNYwVmKdj1iDuNV3WCJSe8E6JDIdNZwBcqvpp/zrgQrl4uSS
         /bGjgz98B/WzV1Q+LpmscaK0iK74vYBxsWDEtJHjKnVMwYp2UDtbxSvsd8wC1z2jhyqF
         XY/bgf50ISZ2UAN5DXaiLmXQi2AIA8xKv3V3gJMRWo7rtTzn3ysZA/ntjJbdoxgzsd7w
         3qrBn+4zWdWJBkIoOWtGroRPoR84zTBSRxasXnihcAXPLkCzV0NhRVRVEwBtcIY0iM8U
         w3Ow==
X-Gm-Message-State: AOJu0YwwUFgpbz9X+DMGD15FrBYP/4pwGv21HKo+0j5BSt7Mcbj2OBqh
        IKsM0FsuDNN/bX/X0uivXqLV2w==
X-Google-Smtp-Source: AGHT+IHJndDQG9aAVEP8VOwCX4dTzbOMcwnbnj+Ha6Hf1f7Ztt5hjbzUXDKhMeEhthYGOu22jdCxLg==
X-Received: by 2002:a05:6602:73a:b0:794:da1e:b249 with SMTP id g26-20020a056602073a00b00794da1eb249mr12614585iox.1.1693925040086;
        Tue, 05 Sep 2023 07:44:00 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 24-20020a0566380a5800b0042b05c1b702sm4117731jap.12.2023.09.05.07.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 07:43:59 -0700 (PDT)
Message-ID: <706c8b32-e530-4768-8d77-7df52c310506@kernel.dk>
Date:   Tue, 5 Sep 2023 08:43:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] io_uring: add a sysctl to disable io_uring system-wide
To:     Matteo Rizzo <matteorizzo@google.com>, io-uring@vger.kernel.org,
        asml.silence@gmail.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, akpm@linux-foundation.org, keescook@chromium.org,
        ribalda@chromium.org, rostedt@goodmis.org, jannh@google.com,
        chenhuacai@kernel.org, gpiccoli@igalia.com, ldufour@linux.ibm.com,
        evn@google.com, poprdi@google.com, jordyzomer@google.com,
        krisman@suse.de, andres@anarazel.de, Jeff Moyer <jmoyer@redhat.com>
References: <x49y1i42j1z.fsf@segfault.boston.devel.redhat.com>
 <CAHKB1wKh3-9icDXK9_qorJr4DZ61Bt7mZznFT75R99a8LeMi_w@mail.gmail.com>
Content-Language: en-US
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHKB1wKh3-9icDXK9_qorJr4DZ61Bt7mZznFT75R99a8LeMi_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/5/23 8:24 AM, Matteo Rizzo wrote:
> Hi all,
> 
> Is there still anything that needs to be changed in this patch? As far as
> I can tell all the remaining feedback has been addressed.

I think we can apply it now. Needs hand applying as it no longer
applies, but pretty trivial.

-- 
Jens Axboe

