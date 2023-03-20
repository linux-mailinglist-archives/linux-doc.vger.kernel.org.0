Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0266C2163
	for <lists+linux-doc@lfdr.de>; Mon, 20 Mar 2023 20:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjCTTaG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Mar 2023 15:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjCTT3X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Mar 2023 15:29:23 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF1418B21
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 12:21:33 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso56891pjf.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 12:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679340081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWhumSwE6VPdraIKdHkGXCZdveSGyvkn+v17HrXzLoU=;
        b=VA8aZkWAwouurkFwtG7y1H2ErfKKJZWtd5n6zNvgQ9V/tbgcrFvDEjgNUX+C26EohC
         3XF5OzB3GuMYennO2skytyBQ67dXiOz+J+yRqnA0MTaIA4ZL73XFzQi6B28vNZkxeOXv
         SrA2p2w4nBtJd+CgCfvqhSJuIht0fkWs9DLQWukwKJRNHBZjGgTFM6EmIFbFYTV/zUUZ
         yDDInIgClxY2cZgPPnHMzu/Q0lSWerxNkwn2AMN2T8lFZY588uwPLVtlLM9GAuqaanZc
         ue3b4QlswNx2ohsNZ0GpI3MomRMNsK3/20Lf+pC9STW4HMJPDhF7hsuAGTxEJC73c8xZ
         xLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679340081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWhumSwE6VPdraIKdHkGXCZdveSGyvkn+v17HrXzLoU=;
        b=uwsXCueMWZAa0tIDzMHK5fWAgFUlBNn5IPoyngh1UPRampDNazePSwnoglySwyUjpw
         BA+FW6QeyGSWvPL3n2nAX9wacQReQfB7Br5GyxJ4RxD1XrWYGYHIXg34otXHO6bid6X3
         WZSrdHqhNQxLcFRXPKYkXaOM4+ZauJxK8UVMk4q51eG9Q6RzSHnnzvswfkt/TcWmZ+Tg
         KWmmVneL5icybC7Bc5rWZm6EbqfT+G+DDlrfnFl9VBTuG8py+BzrbfTPA8EBrhXpvFtD
         y5Z8gVWqU7pTa2/85UlH+cXQocU4j1eUngiR6WhmkSFLvQ+ajATJkXjogvWveLvUiNeY
         IFQw==
X-Gm-Message-State: AO0yUKWMqmeWJ6prnw12EL8TxMw9vNMBsL/ZVq2jc3D7JOoG4PMWklZI
        EAS3xGzRnlzIX+VR6AYeBukfCcyH7ZnnDh1EEdi83w==
X-Google-Smtp-Source: AK7set97ym3r3TVpdTad4XjDZPrMBp8LWDpdIFqTUCzJk9uiQxZ8zofvh8E3jDnD5nKC5aWGXAkBO7iJddRY68bTF8Q=
X-Received: by 2002:a17:902:c94f:b0:1a0:527b:9189 with SMTP id
 i15-20020a170902c94f00b001a0527b9189mr6877966pla.11.1679340080664; Mon, 20
 Mar 2023 12:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230316225915.494688-1-rmoar@google.com>
In-Reply-To: <20230316225915.494688-1-rmoar@google.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Mon, 20 Mar 2023 12:21:09 -0700
Message-ID: <CAGS_qxp2u3F4abmYgN+XwCG8CJN37NSqWSC===SWLCjZG8HYBw@mail.gmail.com>
Subject: Re: [KTAP V2 PATCH] ktap_v2: add recognized test name line
To:     Rae Moar <rmoar@google.com>
Cc:     frowand.list@gmail.com, davidgow@google.com,
        skhan@linuxfoundation.org, keescook@chromium.org,
        Tim.Bird@sony.com, brendanhiggins@google.com, corbet@lwn.net,
        guillaume.tucker@collabora.com, kernelci@lists.linux.dev,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 16, 2023 at 3:59=E2=80=AFPM Rae Moar <rmoar@google.com> wrote:
>
> Add recognition of the test name line ("# Subtest: <name>") to the KTAP v=
2
> spec.
>
> The purpose of this line is to declare the name of a test before its
> results. This functionality is especially useful when trying to parse tes=
t
> results incrementally and when interpretting results after a crash.
>
> This line is already compliant with KTAP v1 as it is interpretted as a

minor nit for if there's a v2, s/interprett/interpret (here and above)

Also, I want to elaborate on the previous paragraph a bit more, in
case the motivation isn't clear.
The problem with TAP and KTAP as-is is that the name of a test case is
only known *after* it completes.

So the scenario being referred to is

KTAP version 1
1..1
<lots of output>
<kernel crash, no more output>

It would be nice if parsers could report "test FOO caused a crash" as
opposed to "the first test case caused a crash, good luck figuring out
which one that was"

Daniel
