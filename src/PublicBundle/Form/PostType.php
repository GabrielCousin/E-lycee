<?php

namespace PublicBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

class PostType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title')
            ->add('extract')
            ->add('content')
            ->add('picture', 'iphp_file')
            ->add('createAt', 'date', array(
                'widget' => 'single_text'
            ))
            ->add('status','entity', array(
                'class' => 'PublicBundle:Status',
                'property' => 'label'
            ))
        ;
        $builder->addEventListener(FormEvents::PRE_SET_DATA, function(FormEvent $event) {
            $post = $event->getData();
            $form = $event->getForm();

        });
    }

    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'PublicBundle\Entity\Post'
        ));
    }


    /**
     * @return string
     */
    public function getName()
    {
        return 'publicbundle_post';
    }
}
