Return-Path: <linux-doc+bounces-483-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1837CD6E1
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 10:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F10061F23778
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 08:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4ABE14F76;
	Wed, 18 Oct 2023 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGlUJPga"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFB811723
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 08:46:19 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA43C6;
	Wed, 18 Oct 2023 01:46:17 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6b20a48522fso4214744b3a.1;
        Wed, 18 Oct 2023 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697618777; x=1698223577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjM8NJM6JVllRLYgSnqxLAwOLXcWEQAjyuI0Ba4HE+U=;
        b=RGlUJPgaAbhah3No4hAbopJ/BSPdzOf73CA5yt/f9lEedbf2sGeYlPbBig4bNV5M7E
         jbdI9tq9uRFGRXaeUph+SDUdF9TJWKB/R9536oRY6dtYwlda5eO1vagy+/mYTYtcV4Jg
         m1WFK9uV+DTfGD5UFmDz5AbpoWOfP6cGPhgFP51XcEpWxICEZmP/GwMxbifqDzguCL2c
         eez7ZK4OrIQqfBRkoT8hGzH4jhR4QUXk+tBknd665sHhmWvKG9koV6Wx99tiACicpiEa
         HXVrwpHMUYsTemTBiYM59yQS0Sj+SEiqTWR8iS8SJLuAcDuaI3OA6wvnPbCP0bdvQGyY
         7bMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697618777; x=1698223577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjM8NJM6JVllRLYgSnqxLAwOLXcWEQAjyuI0Ba4HE+U=;
        b=n9n3qvt/uOyxy3a2D7mgHoU1377hcABSsnPZTzGCjhOMQjHJaUq2AdiRIT2iBDndoD
         O9sdJ5LHo5Z9iFDhS6MjukyKa5lgD4JKErfKGrcBlxWPlqa/PWaK/H4JEXg9kDUIn3Kc
         z+tP2E2co8jxYpDRrnpW7Gd1RtaQ3bU64ZVFdyvb3QPACMvS6/eEkrgJjUydN+2PdCOU
         //YDak8uNO+gblp6HHUetAfz8QSdN0si2/6Zm0IIwUmmX5CFw3Vg4rI3RgEyRi/IGnni
         psdmToqKf3lVsmrxXl9D4rFvt1o/ZU2rg4G/gmkQ7zVDW0zW3jGfVS6JGkUKDm8JDNtR
         +ZgA==
X-Gm-Message-State: AOJu0YyQVuCEqzZQ5ay3oS9VJFuoJLd6A7+imQ04pql9AK8w4i7umlX4
	1PEG22uvHrnzZHJbHso7S7k=
X-Google-Smtp-Source: AGHT+IG8R9G5TZ+zQwGOq2WBl4PnJCcrqIk75aloxXiztkp1XP4DNIRMi5/iueAfV9rDsF01rx7A2A==
X-Received: by 2002:a05:6a20:a123:b0:159:b7ba:74bd with SMTP id q35-20020a056a20a12300b00159b7ba74bdmr5205717pzk.50.1697618777184;
        Wed, 18 Oct 2023 01:46:17 -0700 (PDT)
Received: from localhost (dhcp-72-235-13-41.hawaiiantel.net. [72.235.13.41])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902b58700b001ca4c20003dsm2954311pls.69.2023.10.18.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 01:46:16 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 17 Oct 2023 22:46:15 -1000
From: Tejun Heo <tj@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Hunt <pehunt@redhat.com>
Subject: Re: [PATCH] docs/cgroup: Add the list of threaded controllers to
 cgroup-v2.rst
Message-ID: <ZS-bVxCAptXLotC_@slm.duckdns.org>
References: <20231017171341.3683352-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017171341.3683352-1-longman@redhat.com>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 01:13:41PM -0400, Waiman Long wrote:
> The cgroup-v2 file mentions the concept of threaded controllers which can
> be used in a threaded cgroup. However, it doesn't mention clearly which
> controllers are threaded leading to some confusion about what controller
> can be used requiring some experimentation. Clear this up by explicitly
> listing the controllers that can be used currently in a threaded cgroup.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>

Applied to cgroup/for-6.7.

Thanks.

-- 
tejun

