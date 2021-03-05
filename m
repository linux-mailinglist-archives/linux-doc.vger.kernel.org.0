Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0AE32E3ED
	for <lists+linux-doc@lfdr.de>; Fri,  5 Mar 2021 09:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbhCEItn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 5 Mar 2021 03:49:43 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:34522 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229578AbhCEIta (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Mar 2021 03:49:30 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0UQYfRJg_1614934166;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UQYfRJg_1614934166)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 05 Mar 2021 16:49:27 +0800
Subject: Re: [PATCH v3 6/9] docs/zh_CN: Improve zh_CN/process/5.Posting.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1614920267.git.bobwxc@email.cn>
 <e2e8e109c7709ebbed9f536cbe49f6f56f38d5bf.1614920267.git.bobwxc@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <6e0faac1-1e85-e48c-18c1-414618b0887d@linux.alibaba.com>
Date:   Fri, 5 Mar 2021 16:49:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e2e8e109c7709ebbed9f536cbe49f6f56f38d5bf.1614920267.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/3/5 下午1:27, Wu XiangCheng 写道:
> Improve language and grammar of zh_CN/process/5.Posting.rst
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

Hi XiangCheng,

Thanks for the polishing! 

When I try to give me Reviewed-by for patch 5~9. I found you pick it up
for them.  Please don't do such assumption next time.

Thanks
Alex


> ---
>  .../translations/zh_CN/process/5.Posting.rst  | 243 +++++++++---------
>  1 file changed, 125 insertions(+), 118 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/process/5.Posting.rst b/Documentation/translations/zh_CN/process/5.Posting.rst
> index 9ff9945f918c..b0c65614844d 100644
> --- a/Documentation/translations/zh_CN/process/5.Posting.rst
> +++ b/Documentation/translations/zh_CN/process/5.Posting.rst
> @@ -1,150 +1,157 @@
>  .. include:: ../disclaimer-zh_CN.rst
>  
>  :Original: :ref:`Documentation/process/5.Posting.rst <development_posting>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
> +
> +:Translator:
> +
> + 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> +
> +:校译:
> +
> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
>  
>  .. _cn_development_posting:
>  
>  发布补丁
>  ========
>  
> -迟早，当您的工作准备好提交给社区进行审查，并最终包含到主线内核中时。不出所料，
> +您的工作迟早会准备好提交给社区进行审查，并最终包含到主线内核中。毫不稀奇，
>  内核开发社区已经发展出一套用于发布补丁的约定和过程；遵循这些约定和过程将使
> -参与其中的每个人的生活更加轻松。本文件将试图合理详细地涵盖这些期望；更多信息
> -也可在以下文件中找到
> -:ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`,
> -:ref:`Documentation/process/submitting-drivers.rst  <submittingdrivers>`
> -和 :ref:`Documentation/translations/zh_CN/process/submit-checklist.rst <cn_submitchecklist>`.
> +参与其中的每个人的生活更加轻松。本文档试图描述这些约定的部分细节；更多信息
> +也可在以下文档中找到
> +:ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`，
> +:ref:`Documentation/translations/zh_CN/process/submitting-drivers.rst <cn_submittingdrivers>`
> +和 :ref:`Documentation/translations/zh_CN/process/submit-checklist.rst <cn_submitchecklist>`。
>  
>  何时邮寄
>  --------
>  
> -在补丁完全“准备好”之前，有一个不断的诱惑来避免发布补丁。对于简单的补丁，
> -这不是问题。但是，如果正在完成的工作很复杂，那么在工作完成之前从社区获得
> -反馈就可以获得很多好处。因此，您应该考虑发布正在进行的工作，甚至使Git树
> -可用，以便感兴趣的开发人员可以随时赶上您的工作。
> +在补丁完全“准备好”之前，避免发布补丁是一种持续的诱惑。对于简单的补丁，这
> +不是问题。但是如果正在完成的工作很复杂，那么在工作完成之前从社区获得反馈就
> +可以获得很多好处。因此，您应该考虑发布正在进行的工作，甚至维护一个可用的Git
> +树，以便感兴趣的开发人员可以随时赶上您的工作。
>  
> -当发布还没有准备好包含的代码时，最好在发布本身中这样说。还应提及任何有待完成
> -的主要工作和任何已知问题。很少有人会看到那些被认为是半生不熟的补丁，但是那些
> -人会想到他们可以帮助你把工作推向正确的方向。
> +当发布中有尚未准备好被包含的代码，最好在发布中说明。还应提及任何有待完成的
> +主要工作和任何已知问题。很少有人会愿意看那些被认为是半生不熟的补丁，但是
> +那些愿意的人会带着他们的点子来一起帮助你把工作推向正确的方向。
>  
>  创建补丁之前
>  ------------
>  
> -在考虑将补丁发送到开发社区之前，有许多事情应该做。这些包括：
> +在考虑将补丁发送到开发社区之前，有许多事情应该做。包括：
>  
> - - 尽可能地测试代码。利用内核的调试工具，确保内核使用所有合理的配置选项组合
> -   进行构建，使用跨编译器为不同的体系结构进行构建等。
> + - 尽可能地测试代码。利用内核的调试工具，确保内核使用了所有可能的配置选项组合
> +   进行构建，使用交叉编译器为不同的体系结构进行构建等。
>  
> - - 确保您的代码符合内核编码风格指南。
> + - 确保您的代码符合内核代码风格指南。
>  
>   - 您的更改是否具有性能影响？如果是这样，您应该运行基准测试来显示您的变更的
>     影响（或好处）；结果的摘要应该包含在补丁中。
>  
>   - 确保您有权发布代码。如果这项工作是为雇主完成的，雇主对这项工作具有所有权，
> -   并且必须同意根据GPL对其进行放行。
> +   并且必须同意根据GPL对其进行发布。
>  
>  一般来说，在发布代码之前进行一些额外的思考，几乎总是能在短时间内得到回报。
>  
>  补丁准备
>  --------
>  
> -准备发布补丁可能是一个惊人的工作量，但再次尝试节省时间在这里通常是不明智的，
> -即使在短期内。
> +准备补丁发布的工作量可能很惊人，但在此尝试节省时间通常是不明智的，即使在短期
> +内亦然。
>  
> -必须针对内核的特定版本准备补丁。作为一般规则，补丁程序应该基于Linus的Git树中
> -的当前主线。当以主线为基础时，从一个众所周知的发布点开始——一个稳定的或RC的
> -发布——而不是在一个主线分支任意点。
> +必须针对内核的特定版本准备补丁。一般来说，补丁应该基于Linus的Git树中的当前
> +主线。当以主线为基础时，请从一个众所周知的发布点开始——如稳定版本或 -rc
> +版本发布点——而不是在一个任意的主线分支点。
>  
> -但是，可能需要针对-mm、linux-next或子系统树生成版本，以便于更广泛的测试和审查。
> -根据补丁的区域以及其他地方的情况，针对这些其他树建立补丁可能需要大量的工作来
> +也可能需要针对-mm、linux-next或子系统树生成版本，以便于更广泛的测试和审查。
> +根据补丁的区域以及其他地方的情况，针对其他树建立的补丁可能需要大量的工作来
>  解决冲突和处理API更改。
>  
>  只有最简单的更改才应格式化为单个补丁；其他所有更改都应作为一系列逻辑更改进行。
>  分割补丁是一门艺术；一些开发人员花了很长时间来弄清楚如何按照社区期望的方式来
> -做。然而，有一些经验法则可以大大帮助：
> +分割。不过，这些经验法则也许有帮助：
>  
> - - 您发布的补丁程序系列几乎肯定不会是工作系统中的一系列更改。相反，您所做的
> -   更改需要在最终形式中加以考虑，然后以有意义的方式进行拆分。开发人员对离散的、
> -   自包含的更改感兴趣，而不是您获取这些更改的路径。
> + - 您发布的补丁系列几乎肯定不会是开发过程中版本控制系统中的一系列更改。相反，
> +   需要对您所做更改的最终形式加以考虑，然后以有意义的方式进行拆分。开发人员对
> +   离散的、自包含的更改感兴趣，而不是您创造这些更改的原始路径。
>  
> - - 每个逻辑上独立的变更都应该格式化为单独的补丁。这些更改可以是小的（“向此
> -   结构添加字段”）或大的（例如，添加一个重要的新驱动程序），但它们在概念上
> -   应该是小的，并且可以接受一行描述。每个补丁都应该做一个特定的更改，可以单独
> -   检查并验证它所做的事情。
> + - 每个逻辑上独立的变更都应该格式化为单独的补丁。这些更改可以是小的（如“向
> +   此结构体添加字段”）或大的（如添加一个重要的新驱动程序），但它们在概念上
> +   应该是小的，并且可以在一行内简述。每个补丁都应该做一个特定的、可以单独
> +   检查并验证它所做的事情的更改。
>  
> - - 作为重申上述准则的一种方法：不要在同一补丁中混合不同类型的更改。如果一个
> -   补丁修复了一个关键的安全漏洞，重新排列了一些结构，并重新格式化了代码，那么
> -   很有可能它会被忽略，而重要的修复将丢失。
> + - 换种方式重申上述准则，也就是说：不要在同一补丁中混合不同类型的更改。如果
> +   一个补丁修复了一个关键的安全漏洞，又重新排列了一些结构，还重新格式化了代
> +   码，那么它很有可能会被忽略，从而导致重要的修复丢失。
>  
> - - 每个补丁都应该产生一个内核，它可以正确地构建和运行；如果补丁系列在中间被
> -   中断，那么结果应该仍然是一个工作的内核。补丁系列的部分应用是使用
> -   “git bisct”工具查找回归的一个常见场景；如果结果是一个损坏的内核，那么对于
> -   那些从事追踪问题的高尚工作的开发人员和用户来说，将使他们的生活更加艰难。
> + - 每个补丁都应该能创建一个可以正确地构建和运行的内核；如果补丁系列在中间被
> +   断开，那么结果仍应是一个正常工作的内核。部分应用一系列补丁是使用
> +   “git bisct”工具查找回归的一个常见场景；如果结果是一个损坏的内核，那么将使
> +   那些从事追踪问题的高尚工作的开发人员和用户的生活更加艰难。
>  
> - - 不过，不要过分。一位开发人员曾经将一组编辑内容作为500个单独的补丁发布到一个
> -   文件中，这并没有使他成为内核邮件列表中最受欢迎的人。一个补丁可以相当大，
> -   只要它仍然包含一个单一的逻辑变更。
> + - 不要过分分割。一位开发人员曾经将一组针对单个文件的编辑分成500个单独的补丁
> +   发布，这并没有使他成为内核邮件列表中最受欢迎的人。一个补丁可以相当大，
> +   只要它仍然包含一个单一的 *逻辑* 变更。
>  
> - - 用一系列补丁添加一个全新的基础设施是很有诱惑力的，但是在系列中的最后一个
> -   补丁启用整个补丁之前，该基础设施是不使用的。如果可能的话，应该避免这种
> -   诱惑；如果这个系列增加了回归，那么二分法将指出最后一个补丁是导致问题的
> -   补丁，即使真正的bug在其他地方。只要有可能，添加新代码的补丁程序应该立即
> -   激活该代码。
> + - 用一系列补丁添加一个全新的基础设施，但是该设施在系列中的最后一个补丁启用
> +   整个变更之前不能使用，这看起来很诱人。如果可能的话，应该避免这种诱惑；
> +   如果这个系列增加了回归，那么二分法将指出最后一个补丁是导致问题的补丁，
> +   即使真正的bug在其他地方。只要有可能，添加新代码的补丁程序应该立即激活该
> +   代码。
>  
> -创建完美补丁系列的工作可能是一个令人沮丧的过程，在完成“真正的工作”之后需要花费
> -大量的时间和思考。但是，如果做得好，这是一段很好的时间。
> +创建完美补丁系列的工作可能是一个令人沮丧的过程，在完成“真正的工作”之后需要
> +花费大量的时间和思考。但是如果做得好，花费的时间就是值得的。
>  
>  补丁格式和更改日志
>  ------------------
>  
>  所以现在你有了一系列完美的补丁可以发布，但是这项工作还没有完成。每个补丁都
> -需要被格式化成一条消息，它可以快速而清晰地将其目的传达给世界其他地方。为此，
> +需要被格式化成一条消息，以快速而清晰地将其目的传达到世界其他地方。为此，
>  每个补丁将由以下部分组成：
>  
> - - 命名补丁作者的可选“from”行。只有当你通过电子邮件传递别人的补丁时，这一行
> -   才是必要的，但是如果有疑问，添加它不会有任何伤害。
> + - 可选的“From”行，表明补丁作者。只有当你通过电子邮件发送别人的补丁时，这一行
> +   才是必须的，但是为防止疑问加上它也不会有什么坏处。
>  
> - - 一行描述补丁的作用。对于没有其他上下文的读者来说，此消息应该足够了解补丁
> -   的范围；这是将在“短格式”变更日志中显示的行。此消息通常首先用相关的子系统
> -   名称格式化，然后是补丁的目的。例如：
> + - 一行描述，说明补丁的作用。对于在没有其他上下文的情况下看到该消息的读者来说，
> +   该消息应足以确定修补程序的范围；此行将显示在“short form（简短格式）”变更
> +   日志中。此消息通常需要先加上子系统名称前缀，然后是补丁的目的。例如：
>  
> -    ::
> +   ::
>  
> -	gpio: fix build on CONFIG_GPIO_SYSFS=n
> +        gpio: fix build on CONFIG_GPIO_SYSFS=n
>  
> - - 一个空白行，后面是补丁内容的详细描述。这个描述可以是必需的；它应该说明补丁
> + - 一行空白，后接补丁内容的详细描述。此描述可以是任意需要的长度；它应该说明补丁
>     的作用以及为什么它应该应用于内核。
>  
> - - 一个或多个标记行，至少有一个由补丁作者的：signed-off-by 签名。签名将在下面
> -   更详细地描述。
> + - 一个或多个标记行，至少有一个由补丁作者的 Signed-off-by 签名。标记将在下面
> +   详细描述。
>  
> -上面的项目一起构成补丁的变更日志。写一篇好的变更日志是一门至关重要但常常被
> -忽视的艺术；值得花一点时间来讨论这个问题。当你写一个变更日志时，你应该记住
> -有很多不同的人会读你的话。其中包括子系统维护人员和审查人员，他们需要决定是否
> -应该包括补丁，分销商和其他维护人员试图决定是否应该将补丁反向移植到其他内核，
> -bug搜寻人员想知道补丁是否负责他们正在追查的问题，想知道内核如何变化的用户。
> -等等。一个好的变更日志以最直接和最简洁的方式向所有这些人传达所需的信息。
> +上面的项目一起构成补丁的变更日志。写一则好的变更日志是一门至关重要但常常被
> +忽视的艺术；值得花一点时间来讨论这个问题。当你编写变更日志时，你应该记住有
> +很多不同的人会读你的话。其中包括子系统维护人员和审查人员，他们需要决定是否
> +应该合并补丁，分销商和其他维护人员试图决定是否应该将补丁反向移植到其他内核，
> +缺陷搜寻人员想知道补丁是否导致他们正在追查的问题，以及想知道内核如何变化的
> +用户等等。一个好的变更日志以最直接和最简洁的方式向所有这些人传达所需的信息。
>  
> -为此，总结行应该描述变更的影响和动机，以及在一行约束条件下可能发生的变化。
> +在结尾，总结行应该描述变更的影响和动机，以及在一行约束条件下可能发生的变化。
>  然后，详细的描述可以详述这些主题，并提供任何需要的附加信息。如果补丁修复了
> -一个bug，请引用引入该bug的commit（如果可能，请在引用commits时同时提供commit id
> -和标题）。如果某个问题与特定的日志或编译器输出相关联，请包含该输出以帮助其他
> -人搜索同一问题的解决方案。如果更改是为了支持以后补丁中的其他更改，那么就这么
> -说。如果更改了内部API，请详细说明这些更改以及其他开发人员应该如何响应。一般
> -来说，你越能把自己放在每个阅读你的changelog的人的位置上，changelog（和内核
> +一个缺陷，请引用引入该缺陷的提交（如果可能，请在引用提交时同时提供其 id 和
> +标题）。如果某个问题与特定的日志或编译器输出相关联，请包含该输出以帮助其他
> +人搜索同一问题的解决方案。如果更改是为了支持以后补丁中的其他更改，那么应当
> +说明。如果更改了内部API，请详细说明这些更改以及其他开发人员应该如何响应。
> +一般来说，你越把自己放在每个阅读你变更日志的人的位置上，变更日志（和内核
>  作为一个整体）就越好。
>  
> -不用说，变更日志应该是将变更提交到修订控制系统时使用的文本。接下来是：
> +不消说，变更日志是将变更提交到版本控制系统时使用的文本。接下来将是：
>  
> - - 补丁本身，采用统一的（“-u”）补丁格式。将“-p”选项用于diff将使函数名与更改
> -   相关联，从而使结果补丁更容易被其他人读取。
> + - 补丁本身，采用统一的（“-u”）补丁格式。使用“-p”选项来diff将使函数名与
> +   更改相关联，从而使结果补丁更容易被其他人读取。
>  
> -您应该避免在补丁中包括对不相关文件（例如，由构建过程生成的文件或编辑器
> -备份文件）的更改。文档目录中的文件“dontdiff”在这方面有帮助；使用“-X”选项将
> +您应该避免在补丁中包括与更改不相关文件（例如，构建过程生成的文件或编辑器
> +备份文件）。文档目录中的“dontdiff”文件在这方面有帮助；使用“-X”选项将
>  其传递给diff。
>  
> -上面提到的标签用于描述各种开发人员如何与这个补丁的开发相关联。
> +上面提到的标签（tag）用于描述各种开发人员如何与这个补丁的开发相关联。
>  :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`
>  文档中对它们进行了详细描述；下面是一个简短的总结。每一行的格式如下：
>  
> @@ -154,87 +161,87 @@ bug搜寻人员想知道补丁是否负责他们正在追查的问题，想知
>  
>  常用的标签有：
>  
> - - Signed-off-by: 这是一个开发人员的证明，他或她有权提交补丁以包含到内核中。
> -   这是开发来源认证协议，其全文可在
> + - Signed-off-by: 这是一个开发人员的证明，证明他或她有权提交补丁以包含到内核
> +   中。这表明同意开发者来源认证协议，其全文见
>     :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`
> -   中找到，如果没有适当的签字，则不能合并到主线中。
> +   如果没有合适的签字，则不能合并到主线中。
>  
>   - Co-developed-by: 声明补丁是由多个开发人员共同创建的；当几个人在一个补丁上
> -   工作时，它用于将属性赋予共同作者（除了 From: 所赋予的作者之外）。因为
> -   Co-developed-by: 表示作者身份，所以每个共同开发人, 必须紧跟在相关合作作者
> -   的签名之后。具体内容和示例可以在以下文件中找到
> +   工作时，它用于给出共同作者（除了 From: 所给出的作者之外）。由于
> +   Co-developed-by: 表示作者身份，所以每个共同开发人，必须紧跟在相关合作作者
> +   的Signed-off-by之后。具体内容和示例见以下文件
>     :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`
>  
>   - Acked-by: 表示另一个开发人员（通常是相关代码的维护人员）同意补丁适合包含
>     在内核中。
>  
> - - Tested-by: 声明指定的人已经测试了补丁并发现它可以工作。
> + - Tested-by: 声明某人已经测试了补丁并确认它可以工作。
>  
> - - Reviewed-by: 指定的开发人员已经审查了补丁的正确性；有关详细信息，请参阅
> + - Reviewed-by: 表示某开发人员已经审查了补丁的正确性；有关详细信息，请参阅
>     :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`
>  
> - - Reported-by: 指定报告此补丁修复的问题的用户；此标记用于提供感谢。
> + - Reported-by: 指定报告此补丁修复的问题的用户；此标记用于表示感谢。
>  
> - - Cc：指定的人收到了补丁的副本，并有机会对此发表评论。
> + - Cc：指定某人收到了补丁的副本，并有机会对此发表评论。
>  
> -在补丁中添加标签时要小心：只有cc:才适合在没有指定人员明确许可的情况下添加。
> +在补丁中添加标签时要小心：只有Cc:才适合在没有指定人员明确许可的情况下添加。
>  
>  发送补丁
>  --------
>  
> -在邮寄补丁之前，您还需要注意以下几点：
> +在寄出补丁之前，您还需要注意以下几点：
>  
> - - 您确定您的邮件发送程序不会损坏补丁吗？有免费的空白更改或由邮件客户端
> -   执行的行包装的补丁不会在另一端复原，并且通常不会进行任何详细检查。如果有
> -   任何疑问，把补丁寄给你自己，让你自己相信它是完好无损的。
> + - 您确定您的邮件发送程序不会损坏补丁吗？被邮件客户端更改空白或修饰了行的补丁
> +   无法被另一端接受，并且通常不会进行任何详细检查。如果有任何疑问，先把补丁寄
> +   给你自己，让你自己确定它是完好无损的。
>  
>     :ref:`Documentation/translations/zh_CN/process/email-clients.rst <cn_email_clients>`
> -   提供了一些有用的提示，可以让特定的邮件客户机工作以发送补丁。
> +   提供了一些有用的提示，可以让特定的邮件客户端正常发送补丁。
>  
> - - 你确定你的补丁没有愚蠢的错误吗？您应该始终通过scripts/checkpatch.pl运行
> -   补丁程序，并解决它提出的投诉。请记住，checkpatch.pl虽然是大量思考内核
> -   补丁应该是什么样子的体现，但它并不比您聪明。如果修复checkpatch.pl投诉会
> + - 你确定你的补丁没有荒唐的错误吗？您应该始终通过scripts/checkpatch.pl检查
> +   补丁程序，并解决它提出的问题。请记住，checkpatch.pl，虽然体现了对内核补丁
> +   应该是什么样的大量思考，但它并不比您聪明。如果修复checkpatch.pl给的问题会
>     使代码变得更糟，请不要这样做。
>  
>  补丁应始终以纯文本形式发送。请不要将它们作为附件发送；这使得审阅者在答复中更难
>  引用补丁的部分。相反，只需将补丁直接放到您的消息中。
>  
> -邮寄补丁时，重要的是将副本发送给任何可能感兴趣的人。与其他一些项目不同，内核
> -鼓励人们错误地发送过多的副本；不要假定相关人员会看到您在邮件列表中的发布。
> +寄出补丁时，重要的是将副本发送给任何可能感兴趣的人。与其他一些项目不同，内核
> +鼓励人们甚至错误地发送过多的副本；不要假定相关人员会看到您在邮件列表中的发布。
>  尤其是，副本应发送至：
>  
> - - 受影响子系统的维护人员。如前所述，维护人员文件是查找这些人员的第一个地方。
> + - 受影响子系统的维护人员。如前所述，维护人员文件是查找这些人员的首选地方。
>  
>   - 其他在同一领域工作的开发人员，尤其是那些现在可能在那里工作的开发人员。使用
>     git查看还有谁修改了您正在处理的文件，这很有帮助。
>  
> - - 如果您对错误报告或功能请求做出响应，也可以抄送原始发送人。
> + - 如果您对某错误报告或功能请求做出响应，也可以抄送原始发送人。
>  
> - - 将副本发送到相关邮件列表，或者，如果没有其他应用，则发送到Linux内核列表。
> + - 将副本发送到相关邮件列表，或者若无相关列表，则发送到linux-kernel列表。
>  
> - - 如果您正在修复一个bug，请考虑该修复是否应进入下一个稳定更新。如果是这样，
> -   stable@vger.kernel.org 应该得到补丁的副本。另外，在补丁本身的标签中添加
> -   一个“cc:stable@vger.kernel.org”；这将使稳定团队在修复进入主线时收到通知。
> + - 如果您正在修复一个缺陷，请考虑该修复是否应进入下一个稳定更新。如果是这样，
> +   补丁副本也应发到stable@vger.kernel.org 。另外，在补丁本身的标签中添加一个
> +   “Cc: stable@vger.kernel.org”；这将使稳定版团队在修复进入主线时收到通知。
>  
> -当为一个补丁选择接收者时，最好知道你认为谁最终会接受这个补丁并将其合并。虽然
> -可以将补丁直接发送给LinusTorvalds并让他合并，但通常情况下不会这样做。Linus
> -很忙，并且有子系统维护人员负责监视内核的特定部分。通常您会希望维护人员合并您
> -的补丁。如果没有明显的维护人员，Andrew Morton通常是最后的补丁目标。
> +当为一个补丁选择接收者时，最好清楚你认为谁最终会接受这个补丁并将其合并。虽然
> +可以将补丁直接发给Linus Torvalds并让他合并，但通常情况下不会这样做。Linus很
> +忙，并且有子系统维护人员负责监视内核的特定部分。通常您会希望维护人员合并您的
> +补丁。如果没有明显的维护人员，Andrew Morton通常是最后的补丁接收者。
>  
> -补丁需要好的主题行。补丁程序行的规范格式如下：
> +补丁需要好的主题行。补丁主题行的规范格式如下：
>  
>  ::
>  
>  	[PATCH nn/mm] subsys: one-line description of the patch
>  
> -其中“nn”是补丁的序号，“mm”是系列中补丁的总数，“subsys”是受影响子系统的名称。
> -显然，一个单独的补丁可以省略nn/mm。
> +其中“nn”是补丁的序号，“mm”是系列中补丁的总数，“subsys”是受影响子系统的
> +名称。当然，一个单独的补丁可以省略nn/mm。
>  
> -如果您有一系列重要的补丁，那么通常将介绍性描述作为零部分发送。不过，这种约定
> -并没有得到普遍遵循；如果您使用它，请记住简介中的信息不会使它进入内核变更日志。
> +如果您有一系列重要的补丁，那么通常发送一个简介作为第〇部分。不过，这个约定
> +并没有得到普遍遵循；如果您使用它，请记住简介中的信息不会进入内核变更日志。
>  因此，请确保补丁本身具有完整的变更日志信息。
>  
>  一般来说，多部分补丁的第二部分和后续部分应作为对第一部分的回复发送，以便它们
>  在接收端都连接在一起。像git和coilt这样的工具有命令，可以通过适当的线程发送
> -一组补丁。但是，如果您有一个长系列，并且正在使用git，请远离–chain reply-to
> -选项，以避免创建异常深的嵌套。
> +一组补丁。但是，如果您有一长串补丁，并正使用git，请不要使用–-chain-reply-to
> +选项，以避免创建过深的嵌套。
> 
